#ifndef PG_PROCESSFILE_H
#define PG_PROCESSFILE_H

#include "postgres.h"
#include "fmgr.h"
#include "string.h"
#include "stdlib.h"
#include "varatt.h"
#include <unistd.h>  // Для access() - ВАЖНО!
#include <string.h> // для strrchr
#include <sys/stat.h> // для mkdir

#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif

Datum GetFileChunk(PG_FUNCTION_ARGS);
PG_FUNCTION_INFO_V1(GetFileChunk);

Datum CreateFileChunk(PG_FUNCTION_ARGS);
PG_FUNCTION_INFO_V1(CreateFileChunk);

#endif
