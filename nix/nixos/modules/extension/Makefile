# Имя расширения
EXTENSION = pg_processfile

# SQL файл для установки
DATA = $(EXTENSION)--1.0.sql

# Файл управления расширением
CONTROL = $(EXTENSION).control

# Путь к pg_config
PG_CONFIG = pg_config

# Получаем путь к PGXS
PGXS := $(shell $(PG_CONFIG) --pgxs)

# Получаем путь к заголовочным файлам сервера
PG_INCLUDE_SERVER := $(shell $(PG_CONFIG) --includedir-server)
PG_LIB := $(shell $(PG_CONFIG) --pkglibdir)

# Включаем PGXS
include $(PGXS)

# Правило для сборки динамической библиотеки
all: $(EXTENSION).so $(CONTROL) $(DATA)

# Правило для создания динамической библиотеки
$(EXTENSION).so: $(EXTENSION).c
	$(CC) $(CFLAGS) -I$(PG_INCLUDE_SERVER) -shared -o $@ $< $(LDFLAGS) -L$(PG_LIB)

# Dependency on hte CONTROL file
$(CONTROL):

# Dependency on hte DATA file
$(DATA):
