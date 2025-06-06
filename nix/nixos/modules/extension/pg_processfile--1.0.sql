CREATE FUNCTION GetFileChunk (TEXT, BIGINT, INTEGER)
RETURNS BYTEA
AS '$libdir/pg_processfile', 'GetFileChunk'
LANGUAGE C
IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION CreateFileChunk(TEXT, BIGINT, BYTEA, BOOLEAN)
RETURNS VOID
AS '$libdir/pg_processfile', 'CreateFileChunk'
LANGUAGE C STRICT;
