


CREATE TABLE job_details (
    id                     VARCHAR (50)       NOT NULL,
    correlation_id         VARCHAR (50)       NULL,
    status                 VARCHAR (40)       NULL,
    last_update            DATETIMEOFFSET (7) NULL,
    retries                INT                NULL,
    execution_counter      INT                NULL,
    scheduled_id           VARCHAR (40)       NULL,
    priority               INT                NULL,
    recipient              NVARCHAR (MAX)     NULL,
    job_trigger            NVARCHAR (MAX)     NULL,
    fire_time              DATETIMEOFFSET (7) NULL,
    execution_timeout      BIGINT             NULL,
    execution_timeout_unit VARCHAR (40)       NULL,
    created                DATETIMEOFFSET (7) NULL,
    CONSTRAINT job_details_pkey1 PRIMARY KEY (id ASC)
);



CREATE INDEX job_details_created_idx
    ON job_details(created ASC);



CREATE INDEX job_details_fire_time_idx
    ON job_details(fire_time ASC);



CREATE TABLE job_service_management (
    id             VARCHAR (40)       NOT NULL,
    last_heartbeat DATETIMEOFFSET (7) NULL,
    token          VARCHAR (40)       NULL,
    CONSTRAINT job_service_management_pkey PRIMARY KEY (id ASC),
    CONSTRAINT job_service_management_token_key UNIQUE (token ASC)
);
