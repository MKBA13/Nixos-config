#include "pg_processfile.h"

//PG_FUNCTION_INFO_V1(GetFileChunk);
Datum GetFileChunk(PG_FUNCTION_ARGS) {
    char *filePath;
    FILE *fp = NULL;
    bytea *fileContent = NULL;
	size_t bytesRead;
	//long fileSize;
    long offset = PG_GETARG_INT64(1); // Смещение
    int chunkSize = PG_GETARG_INT32(2); // Размер куска

    // 1. Получаем путь к файлу
    filePath = PG_GETARG_CSTRING(0);

    // 2. Открываем файл в бинарном режиме для чтения ("rb")
    fp = fopen(filePath, "rb");
    if (fp == NULL) {
        ereport(ERROR, (errcode_for_file_access(), errmsg("cannot open file: %s", filePath)));
        pfree(filePath);
        PG_RETURN_NULL();
    }

    // 3. Устанавливаем смещение
    if (fseek(fp, offset, SEEK_SET) != 0) {
        ereport(ERROR, (errcode_for_file_access(), errmsg("Error seeking in file: %s", filePath)));
        fclose(fp);
        pfree(filePath);
        PG_RETURN_NULL();
    }

    // 4. Выделяем память для содержимого файла
    fileContent = (bytea *)palloc(VARHDRSZ + chunkSize);

    if (fileContent == NULL) {
        ereport(ERROR, (errcode_for_file_access(), errmsg("cannot allocate memory for the content of file: %s", filePath)));
        fclose(fp);
        pfree(filePath);
        PG_RETURN_NULL();
    }

    SET_VARSIZE(fileContent, VARHDRSZ + chunkSize);
    
    // 5. Читаем содержимое файла
    bytesRead = fread(VARDATA(fileContent), 1, chunkSize, fp);
    if (bytesRead < 0) {
        ereport(ERROR, (errcode_for_file_access(), errmsg("cannot read data from file: %s", filePath)));
        pfree(fileContent);
        fclose(fp);
        pfree(filePath);
        PG_RETURN_NULL();
    }

    // 6. Устанавливаем фактический размер
    SET_VARSIZE(fileContent, VARHDRSZ + bytesRead);
    
    // 7. Закрываем файл
    fclose(fp);
    pfree(filePath);

    // 8. Возвращаем данные в виде bytea
    PG_RETURN_BYTEA_P(fileContent);
}

//PG_FUNCTION_INFO_V1(CreateFileChunk);
Datum CreateFileChunk(PG_FUNCTION_ARGS)
{
    char       *filePath = PG_GETARG_CSTRING(0);
    int64       offset = PG_GETARG_INT64(1);
    bytea      *fileContent = PG_GETARG_BYTEA_P(2);
    bool		append = PG_GETARG_BOOL(3);
    FILE       *fp = NULL;
    const char *openMode;

    // Проверка существования каталога (мера предосторожности). Лучше проверять при создании функции.
    char *dirPath = pstrdup(filePath);
    char *lastSlash = strrchr(dirPath, '/');
    if (lastSlash != NULL) {
        *lastSlash = '\0'; // Обрезаем путь до каталога
        if (access(dirPath, W_OK) != 0) { // Проверяем доступность каталога для записи
             ereport(ERROR,
                (errcode_for_file_access(),
                 errmsg("cannot write to directory: %s", dirPath)));
              pfree(dirPath);
              pfree(filePath);
              PG_RETURN_VOID();
        }
    }
    pfree(dirPath);

    // Выбираем режим открытия файла: "wb" - перезапись, "ab" - добавление в конец
    openMode = append ? "ab" : "wb";

    // Открываем файл.
    fp = fopen(filePath, openMode); // "wb"  для записи, "ab" для добавления

    if (fp == NULL)
    {
        ereport(ERROR,
                (errcode_for_file_access(),
                 errmsg("cannot open file: %s", filePath)));
        pfree(filePath);
        PG_RETURN_VOID();
    }

    // Устанавливаем смещение, если нужно.  Для режима "ab" это не требуется.
	if (!append && fseeko(fp, offset, SEEK_SET) != 0) //fseeko использует off_t (int64)
    {
        ereport(ERROR,
                (errcode_for_file_access(),
                 errmsg("cannot seek to offset %lld in file: %s", (long long)offset, filePath)));
        fclose(fp);
        pfree(filePath);
        PG_RETURN_VOID();
    }


    // Записываем данные.
    if (fileContent != NULL)
    {
        size_t bytesToWrite = VARSIZE(fileContent) - VARHDRSZ;
        size_t bytesWritten = fwrite(VARDATA(fileContent), 1, bytesToWrite, fp);

        if (bytesWritten != bytesToWrite)
        {
            ereport(ERROR,
                    (errcode_for_file_access(),
                     errmsg("wrote only %zu of %zu bytes to file: %s", bytesWritten, bytesToWrite, filePath)));
            fclose(fp);
            pfree(filePath);
            PG_RETURN_VOID();
        }
    }

    // Закрываем файл.
    fclose(fp);
    pfree(filePath);
    PG_RETURN_VOID();
}
