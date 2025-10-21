


CREATE TABLE audit_query (
    identifier          VARCHAR (255)  NOT NULL,
    graph_ql_definition VARCHAR (5000) NULL,
    query               VARCHAR (5000) NULL,
    CONSTRAINT audit_query_pkey PRIMARY KEY (identifier ASC)
);



CREATE TABLE job_execution_log (
    id                  BIGINT        NOT NULL,
    event_date          DATETIME2 (6) NULL,
    execution_counter   INT           NULL,
    expiration_time     DATETIME2 (6) NULL,
    job_id              VARCHAR (255) NULL,
    node_instance_id    VARCHAR (255) NULL,
    priority            INT           NULL,
    process_instance_id VARCHAR (255) NULL,
    repeat_interval     BIGINT        NULL,
    repeat_limit        INT           NULL,
    retries             INT           NULL,
    scheduled_id        VARCHAR (255) NULL,
    status              VARCHAR (255) NULL,
    CONSTRAINT job_execution_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_jel_jid
    ON job_execution_log(job_id ASC);



CREATE INDEX ix_jel_status
    ON job_execution_log(status ASC);



CREATE INDEX ix_jel_pid
    ON job_execution_log(process_instance_id ASC);



CREATE TABLE process_instance_error_log (
    id                         BIGINT         NOT NULL,
    business_key               VARCHAR (255)  NULL,
    event_date                 DATETIME2 (6)  NULL,
    event_id                   VARCHAR (255)  NULL,
    parent_process_instance_id VARCHAR (255)  NULL,
    process_id                 VARCHAR (255)  NULL,
    process_instance_id        VARCHAR (255)  NULL,
    process_type               VARCHAR (255)  NULL,
    process_version            VARCHAR (255)  NULL,
    root_process_id            VARCHAR (255)  NULL,
    root_process_instance_id   VARCHAR (255)  NULL,
    error_message              VARCHAR (255)  NULL,
    node_definition_id         VARCHAR (255)  NULL,
    node_instance_id           VARCHAR (255)  NULL,
    event_user                 NVARCHAR (255) NULL,
    CONSTRAINT process_instance_error_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_piel_key
    ON process_instance_error_log(business_key ASC);



CREATE INDEX ix_piel_event_date
    ON process_instance_error_log(event_date ASC);



CREATE INDEX ix_piel_pid
    ON process_instance_error_log(process_instance_id ASC);



CREATE TABLE process_instance_node_log (
    id                         BIGINT         NOT NULL,
    business_key               VARCHAR (255)  NULL,
    event_date                 DATETIME2 (6)  NULL,
    event_id                   VARCHAR (255)  NULL,
    parent_process_instance_id VARCHAR (255)  NULL,
    process_id                 VARCHAR (255)  NULL,
    process_instance_id        VARCHAR (255)  NULL,
    process_type               VARCHAR (255)  NULL,
    process_version            VARCHAR (255)  NULL,
    root_process_id            VARCHAR (255)  NULL,
    root_process_instance_id   VARCHAR (255)  NULL,
    connection                 VARCHAR (255)  NULL,
    event_data                 VARCHAR (255)  NULL,
    event_type                 VARCHAR (255)  NULL,
    node_definition_id         VARCHAR (255)  NULL,
    node_instance_id           VARCHAR (255)  NULL,
    node_name                  VARCHAR (255)  NULL,
    node_type                  VARCHAR (255)  NULL,
    sla_due_date               DATETIME2 (6)  NULL,
    work_item_id               VARCHAR (255)  NULL,
    event_user                 NVARCHAR (255) NULL,
    CONSTRAINT process_instance_node_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_pinl_pid
    ON process_instance_node_log(process_instance_id ASC);



CREATE INDEX ix_pinl_key
    ON process_instance_node_log(business_key ASC);



CREATE INDEX ix_pinl_event_date
    ON process_instance_node_log(event_date ASC);



CREATE TABLE process_instance_state_log (
    id                         BIGINT         NOT NULL,
    business_key               VARCHAR (255)  NULL,
    event_date                 DATETIME2 (6)  NULL,
    event_id                   VARCHAR (255)  NULL,
    parent_process_instance_id VARCHAR (255)  NULL,
    process_id                 VARCHAR (255)  NULL,
    process_instance_id        VARCHAR (255)  NULL,
    process_type               VARCHAR (255)  NULL,
    process_version            VARCHAR (255)  NULL,
    root_process_id            VARCHAR (255)  NULL,
    root_process_instance_id   VARCHAR (255)  NULL,
    event_type                 VARCHAR (255)  NOT NULL,
    outcome                    VARCHAR (255)  NULL,
    sla_due_date               DATETIME2 (6)  NULL,
    state                      VARCHAR (255)  NULL,
    event_user                 NVARCHAR (255) NULL,
    CONSTRAINT process_instance_state_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_pisl_key
    ON process_instance_state_log(business_key ASC);



CREATE INDEX ix_pisl_pid
    ON process_instance_state_log(process_instance_id ASC);



CREATE INDEX ix_pisl_state
    ON process_instance_state_log(state ASC);



CREATE INDEX ix_pisl_event_date
    ON process_instance_state_log(event_date ASC);



CREATE TABLE process_instance_state_roles_log (
    process_instance_state_log_id BIGINT        NOT NULL,
    role                          VARCHAR (255) NULL
);



CREATE TABLE process_instance_variable_log (
    id                         BIGINT         NOT NULL,
    business_key               VARCHAR (255)  NULL,
    event_date                 DATETIME2 (6)  NULL,
    event_id                   VARCHAR (255)  NULL,
    parent_process_instance_id VARCHAR (255)  NULL,
    process_id                 VARCHAR (255)  NULL,
    process_instance_id        VARCHAR (255)  NULL,
    process_type               VARCHAR (255)  NULL,
    process_version            VARCHAR (255)  NULL,
    root_process_id            VARCHAR (255)  NULL,
    root_process_instance_id   VARCHAR (255)  NULL,
    variable_id                VARCHAR (255)  NULL,
    variable_name              VARCHAR (255)  NULL,
    variable_value             VARCHAR (MAX)  NULL,
    event_user                 NVARCHAR (255) NULL,
    CONSTRAINT process_instance_variable_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_pivl_key
    ON process_instance_variable_log(business_key ASC);



CREATE INDEX ix_pivl_var_id
    ON process_instance_variable_log(variable_id ASC);



CREATE INDEX ix_pivl_event_date
    ON process_instance_variable_log(event_date ASC);



CREATE INDEX ix_pivl_pid
    ON process_instance_variable_log(process_instance_id ASC);



CREATE TABLE task_instance_assignment_log (
    id                      BIGINT        NOT NULL,
    business_key            VARCHAR (255) NULL,
    event_date              DATETIME2 (6) NULL,
    event_id                VARCHAR (255) NULL,
    event_user              VARCHAR (255) NULL,
    process_instance_id     VARCHAR (255) NULL,
    user_task_definition_id VARCHAR (255) NULL,
    user_task_instance_id   VARCHAR (255) NULL,
    assignment_type         VARCHAR (255) NULL,
    task_name               VARCHAR (255) NULL,
    CONSTRAINT task_instance_assignment_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_utasl_event_date
    ON task_instance_assignment_log(event_date ASC);



CREATE INDEX ix_utasl_key
    ON task_instance_assignment_log(business_key ASC);



CREATE INDEX ix_utasl_pid
    ON task_instance_assignment_log(process_instance_id ASC);



CREATE INDEX ix_utasl_utid
    ON task_instance_assignment_log(user_task_instance_id ASC);



CREATE TABLE task_instance_assignment_users_log (
    task_instance_assignment_log_id BIGINT        NOT NULL,
    user_id                         VARCHAR (255) NULL
);



CREATE TABLE task_instance_attachment_log (
    id                      BIGINT        NOT NULL,
    business_key            VARCHAR (255) NULL,
    event_date              DATETIME2 (6) NULL,
    event_id                VARCHAR (255) NULL,
    event_user              VARCHAR (255) NULL,
    process_instance_id     VARCHAR (255) NULL,
    user_task_definition_id VARCHAR (255) NULL,
    user_task_instance_id   VARCHAR (255) NULL,
    attachment_id           VARCHAR (255) NULL,
    attachment_name         VARCHAR (255) NULL,
    attachment_uri          VARCHAR (255) NULL,
    event_type              INT           NULL,
    CONSTRAINT task_instance_attachment_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_utatl_event_date
    ON task_instance_attachment_log(event_date ASC);



CREATE INDEX ix_utatl_pid
    ON task_instance_attachment_log(process_instance_id ASC);



CREATE INDEX ix_utatl_key
    ON task_instance_attachment_log(business_key ASC);



CREATE INDEX ix_utatl_utid
    ON task_instance_attachment_log(user_task_instance_id ASC);



CREATE TABLE task_instance_comment_log (
    id                      BIGINT         NOT NULL,
    business_key            VARCHAR (255)  NULL,
    event_date              DATETIME2 (6)  NULL,
    event_id                VARCHAR (255)  NULL,
    event_user              VARCHAR (255)  NULL,
    process_instance_id     VARCHAR (255)  NULL,
    user_task_definition_id VARCHAR (255)  NULL,
    user_task_instance_id   VARCHAR (255)  NULL,
    comment_content         VARCHAR (1000) NULL,
    comment_id              VARCHAR (255)  NULL,
    event_type              INT            NULL,
    CONSTRAINT task_instance_comment_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_utcl_key
    ON task_instance_comment_log(business_key ASC);



CREATE INDEX ix_utcl_pid
    ON task_instance_comment_log(process_instance_id ASC);



CREATE INDEX ix_utcl_utid
    ON task_instance_comment_log(user_task_instance_id ASC);



CREATE INDEX ix_utcl_event_date
    ON task_instance_comment_log(event_date ASC);



CREATE TABLE task_instance_deadline_log (
    id                      BIGINT        NOT NULL,
    business_key            VARCHAR (255) NULL,
    event_date              DATETIME2 (6) NULL,
    event_id                VARCHAR (255) NULL,
    event_user              VARCHAR (255) NULL,
    process_instance_id     VARCHAR (255) NULL,
    user_task_definition_id VARCHAR (255) NULL,
    user_task_instance_id   VARCHAR (255) NULL,
    event_type              VARCHAR (255) NULL,
    CONSTRAINT task_instance_deadline_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_utdl_pid
    ON task_instance_deadline_log(process_instance_id ASC);



CREATE INDEX ix_utdl_key
    ON task_instance_deadline_log(business_key ASC);



CREATE INDEX ix_utdl_utid
    ON task_instance_deadline_log(user_task_instance_id ASC);



CREATE INDEX ix_utdl_event_date
    ON task_instance_deadline_log(event_date ASC);



CREATE TABLE task_instance_deadline_notification_log (
    task_instance_deadline_log_id BIGINT        NOT NULL,
    property_value                VARCHAR (255) NULL,
    property_name                 VARCHAR (255) NOT NULL,
    CONSTRAINT task_instance_deadline_notification_log_pkey PRIMARY KEY (task_instance_deadline_log_id ASC, property_name ASC)
);



CREATE TABLE task_instance_state_log (
    id                      BIGINT        NOT NULL,
    business_key            VARCHAR (255) NULL,
    event_date              DATETIME2 (6) NULL,
    event_id                VARCHAR (255) NULL,
    event_user              VARCHAR (255) NULL,
    process_instance_id     VARCHAR (255) NULL,
    user_task_definition_id VARCHAR (255) NULL,
    user_task_instance_id   VARCHAR (255) NULL,
    actual_user             VARCHAR (255) NULL,
    description             VARCHAR (255) NULL,
    event_type              VARCHAR (255) NULL,
    name                    VARCHAR (255) NULL,
    state                   VARCHAR (255) NULL,
    CONSTRAINT task_instance_state_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_utsl_pid
    ON task_instance_state_log(process_instance_id ASC);



CREATE INDEX ix_utsl_event_date
    ON task_instance_state_log(event_date ASC);



CREATE INDEX ix_utsl_state
    ON task_instance_state_log(state ASC);



CREATE INDEX ix_utsl_key
    ON task_instance_state_log(business_key ASC);



CREATE INDEX ix_utsl_utid
    ON task_instance_state_log(user_task_instance_id ASC);



CREATE TABLE task_instance_variable_log (
    id                      BIGINT        NOT NULL,
    business_key            VARCHAR (255) NULL,
    event_date              DATETIME2 (6) NULL,
    event_id                VARCHAR (255) NULL,
    event_user              VARCHAR (255) NULL,
    process_instance_id     VARCHAR (255) NULL,
    user_task_definition_id VARCHAR (255) NULL,
    user_task_instance_id   VARCHAR (255) NULL,
    variable_id             VARCHAR (255) NULL,
    variable_name           VARCHAR (255) NULL,
    variable_type           VARCHAR (255) NULL,
    variable_value          VARCHAR (MAX) NULL,
    CONSTRAINT task_instance_variable_log_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX ix_tavl_utid
    ON task_instance_variable_log(user_task_instance_id ASC);



CREATE INDEX ix_tavl_key
    ON task_instance_variable_log(business_key ASC);



CREATE INDEX ix_tavl_pid
    ON task_instance_variable_log(process_instance_id ASC);



CREATE INDEX ix_tavl_event_date
    ON task_instance_variable_log(event_date ASC);



CREATE SEQUENCE job_execution_history_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE process_instance_error_log_seq_id
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE process_instance_node_log_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE process_instance_state_log_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE process_instance_variable_log_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE task_instance_assignment_log_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE task_instance_attachment_log_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE task_instance_comment_log_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE task_instance_deadline_log_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE task_instance_state_log_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE task_instance_variable_log_id_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



ALTER TABLE process_instance_state_roles_log
    ADD CONSTRAINT fk_process_instance_state_pid FOREIGN KEY (process_instance_state_log_id) REFERENCES process_instance_state_log (id) ON DELETE CASCADE;



ALTER TABLE task_instance_assignment_users_log
    ADD CONSTRAINT fk_task_instance_assignment_log_tid FOREIGN KEY (task_instance_assignment_log_id) REFERENCES task_instance_assignment_log (id) ON DELETE CASCADE;



ALTER TABLE task_instance_deadline_notification_log
    ADD CONSTRAINT fk_task_instance_deadline_tid FOREIGN KEY (task_instance_deadline_log_id) REFERENCES task_instance_deadline_log (id) ON DELETE CASCADE;



ALTER TABLE process_instance_node_log
    ADD CONSTRAINT process_instance_node_log_event_type_check CHECK (event_type='STATE_UPDATED' OR event_type='SLA_VIOLATION' OR event_type='ERROR' OR event_type='SKIPPED' OR event_type='OBSOLETE' OR event_type='ASYNC_ENTER' OR event_type='ABORTED' OR event_type='EXIT' OR event_type='ENTER');



ALTER TABLE process_instance_state_log
    ADD CONSTRAINT Process_Instance_State_Log_event_type_check CHECK (event_type='RETRIGGERED' OR event_type='STATE_UPDATED' OR event_type='MIGRATED' OR event_type='SLA_VIOLATION' OR event_type='COMPLETED' OR event_type='ACTIVE');



ALTER TABLE task_instance_variable_log
    ADD CONSTRAINT task_instance_variable_log_variable_type_check CHECK (variable_type='OUTPUT' OR variable_type='INPUT');
