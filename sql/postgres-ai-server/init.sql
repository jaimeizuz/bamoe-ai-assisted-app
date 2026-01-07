CREATE ROLE "langflow-user" WITH
    LOGIN
    SUPERUSER
    INHERIT
    CREATEDB
    CREATEROLE
    NOREPLICATION
    PASSWORD 'langflow-pass';

CREATE ROLE "openwebui-user" WITH
    LOGIN
    SUPERUSER
    INHERIT
    CREATEDB
    CREATEROLE
    NOREPLICATION
    PASSWORD 'openwebui-pass';

CREATE ROLE "langfuse-user" WITH
    LOGIN
    SUPERUSER
    INHERIT
    CREATEDB
    CREATEROLE
    NOREPLICATION
    PASSWORD 'langfuse-pass';

CREATE ROLE "mcpgw-user" WITH
    LOGIN
    SUPERUSER
    INHERIT
    CREATEDB
    CREATEROLE
    NOREPLICATION
    PASSWORD 'mcpgw-pass';

CREATE DATABASE langflow
    WITH
    OWNER = "langflow-user"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE DATABASE langfuse
    WITH
    OWNER = "langfuse-user"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE DATABASE openwebui
    WITH
    OWNER = "openwebui-user"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE DATABASE mcpgw
    WITH
    OWNER = "mcpgw-user"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

GRANT ALL PRIVILEGES ON DATABASE langflow TO "langflow-user";
GRANT ALL PRIVILEGES ON DATABASE openwebui TO "openwebui-user";
GRANT ALL PRIVILEGES ON DATABASE langfuse TO "langfuse-user";
GRANT ALL PRIVILEGES ON DATABASE mcpgw TO "mcpgw-user";
GRANT ALL PRIVILEGES ON DATABASE langflow TO "postgres";
GRANT ALL PRIVILEGES ON DATABASE openwebui TO "postgres";
GRANT ALL PRIVILEGES ON DATABASE langfuse TO "postgres";
GRANT ALL PRIVILEGES ON DATABASE mcpgw TO "postgres";
