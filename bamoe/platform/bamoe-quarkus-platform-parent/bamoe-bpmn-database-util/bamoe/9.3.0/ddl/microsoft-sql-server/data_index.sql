


CREATE TABLE attachments (
    id         VARCHAR (255)      NOT NULL,
    content    VARCHAR (255)      NULL,
    name       VARCHAR (255)      NULL,
    updated_at DATETIMEOFFSET (6) NULL,
    updated_by VARCHAR (255)      NULL,
    task_id    VARCHAR (255)      NOT NULL,
    CONSTRAINT attachments_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_attachments_tid
    ON attachments(task_id ASC);



CREATE TABLE comments (
    id         VARCHAR (255)      NOT NULL,
    content    VARCHAR (1000)     NULL,
    updated_at DATETIMEOFFSET (6) NULL,
    updated_by VARCHAR (255)      NULL,
    task_id    VARCHAR (255)      NOT NULL,
    CONSTRAINT comments_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_comments_tid
    ON comments(task_id ASC);



CREATE TABLE definitions_addons (
    process_id      VARCHAR (255) NOT NULL,
    process_version VARCHAR (255) NOT NULL,
    addon           VARCHAR (255) NOT NULL,
    CONSTRAINT definitions_addons_pkey PRIMARY KEY (process_id ASC, process_version ASC, addon ASC)
);



CREATE INDEX idx_definitions_addons_pid_pv
    ON definitions_addons(process_id ASC, process_version ASC);



CREATE TABLE definitions_annotations (
    annotation      VARCHAR (255) NOT NULL,
    process_id      VARCHAR (255) NOT NULL,
    process_version VARCHAR (255) NOT NULL,
    CONSTRAINT definitions_annotations_pkey PRIMARY KEY (annotation ASC, process_id ASC, process_version ASC)
);



CREATE INDEX idx_definitions_annotations_pid_pv
    ON definitions_annotations(process_id ASC, process_version ASC);



CREATE TABLE definitions_nodes (
    id              VARCHAR (255) NOT NULL,
    name            VARCHAR (255) NULL,
    unique_id       VARCHAR (255) NULL,
    type            VARCHAR (255) NULL,
    process_id      VARCHAR (255) NOT NULL,
    process_version VARCHAR (255) NOT NULL,
    CONSTRAINT definitions_nodes_pkey PRIMARY KEY (id ASC, process_id ASC, process_version ASC)
);



CREATE INDEX idx_definitions_nodes_pid_pv
    ON definitions_nodes(process_id ASC, process_version ASC);



CREATE TABLE definitions_nodes_metadata (
    node_id         VARCHAR (255) NOT NULL,
    process_id      VARCHAR (255) NOT NULL,
    process_version VARCHAR (255) NOT NULL,
    meta_value      VARCHAR (255) NULL,
    name            VARCHAR (255) NOT NULL,
    CONSTRAINT definitions_nodes_metadata_pkey PRIMARY KEY (node_id ASC, process_id ASC, process_version ASC, name ASC)
);



CREATE INDEX idx_definitions_nodes_metadata_pid_pv
    ON definitions_nodes_metadata(process_id ASC, process_version ASC);



CREATE TABLE definitions_roles (
    process_id      VARCHAR (255) NOT NULL,
    process_version VARCHAR (255) NOT NULL,
    role            VARCHAR (255) NOT NULL,
    CONSTRAINT definitions_roles_pkey PRIMARY KEY (process_id ASC, process_version ASC, role ASC)
);



CREATE INDEX idx_definitions_roles_pid_pv
    ON definitions_roles(process_id ASC, process_version ASC);



CREATE TABLE jobs (
    id                       VARCHAR (255)      NOT NULL,
    callback_endpoint        VARCHAR (255)      NULL,
    endpoint                 VARCHAR (255)      NULL,
    execution_counter        INT                NULL,
    expiration_time          DATETIMEOFFSET (6) NULL,
    last_update              DATETIMEOFFSET (6) NULL,
    node_instance_id         VARCHAR (255)      NULL,
    priority                 INT                NULL,
    process_id               VARCHAR (255)      NULL,
    process_instance_id      VARCHAR (255)      NULL,
    repeat_interval          BIGINT             NULL,
    repeat_limit             INT                NULL,
    retries                  INT                NULL,
    root_process_id          VARCHAR (255)      NULL,
    root_process_instance_id VARCHAR (255)      NULL,
    scheduled_id             VARCHAR (255)      NULL,
    status                   VARCHAR (255)      NULL,
    CONSTRAINT jobs_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_jobs_piid
    ON jobs(process_instance_id ASC);



CREATE TABLE kogito_data_cache (
    var_name   VARCHAR (255)  NOT NULL,
    cache_name VARCHAR (255)  NOT NULL,
    json_value NVARCHAR (MAX) NULL,
    CONSTRAINT kogito_data_cache_pkey PRIMARY KEY (var_name ASC, cache_name ASC)
);



CREATE TABLE milestones (
    id                  VARCHAR (255) NOT NULL,
    process_instance_id VARCHAR (255) NOT NULL,
    name                VARCHAR (255) NULL,
    status              VARCHAR (255) NULL,
    CONSTRAINT milestones_pkey PRIMARY KEY (id ASC, process_instance_id ASC)
);



CREATE INDEX idx_milestones_piid
    ON milestones(process_instance_id ASC);



CREATE TABLE nodes (
    id                  VARCHAR (255)      NOT NULL,
    definition_id       VARCHAR (255)      NULL,
    enter_time          DATETIMEOFFSET (6) NULL,
    exit_time           DATETIMEOFFSET (6) NULL,
    name                VARCHAR (255)      NULL,
    node_id             VARCHAR (255)      NULL,
    type                VARCHAR (255)      NULL,
    process_instance_id VARCHAR (255)      NOT NULL,
    sla_due_date        DATETIMEOFFSET (6) NULL,
    retrigger           BIT                NULL,
    error_message       VARCHAR (MAX)      NULL,
    cancel_type         VARCHAR (255)      NULL,
    CONSTRAINT nodes_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_nodes_piid
    ON nodes(process_instance_id ASC);



CREATE TABLE process_definitions (
    id          VARCHAR (255)   NOT NULL,
    version     VARCHAR (255)   NOT NULL,
    name        VARCHAR (255)   NULL,
    type        VARCHAR (255)   NULL,
    source      VARBINARY (MAX) NULL,
    endpoint    VARCHAR (255)   NULL,
    description VARCHAR (255)   NULL,
    metadata    VARCHAR (MAX)   NULL,
    CONSTRAINT definitions_pkey PRIMARY KEY (id ASC, version ASC)
);



CREATE TABLE processes (
    id                         VARCHAR (255)      NOT NULL,
    business_key               VARCHAR (255)      NULL,
    end_time                   DATETIMEOFFSET (6) NULL,
    endpoint                   VARCHAR (255)      NULL,
    message                    VARCHAR (MAX)      NULL,
    node_definition_id         VARCHAR (255)      NULL,
    last_update_time           DATETIMEOFFSET (6) NULL,
    parent_process_instance_id VARCHAR (255)      NULL,
    process_id                 VARCHAR (255)      NULL,
    process_name               VARCHAR (255)      NULL,
    root_process_id            VARCHAR (255)      NULL,
    root_process_instance_id   VARCHAR (255)      NULL,
    start_time                 DATETIMEOFFSET (6) NULL,
    state                      INT                NULL,
    variables                  NVARCHAR (MAX)     NULL,
    version                    VARCHAR (255)      NULL,
    created_by                 VARCHAR (MAX)      NULL,
    updated_by                 VARCHAR (MAX)      NULL,
    sla_due_date               DATETIMEOFFSET (6) NULL,
    node_instance_id           VARCHAR (255)      NULL,
    cloud_event_id             VARCHAR (1000)     NULL,
    cloud_event_source         VARCHAR (1000)     NULL,
    CONSTRAINT processes_pkey PRIMARY KEY (id ASC)
);



CREATE TABLE processes_addons (
    process_id VARCHAR (255) NOT NULL,
    addon      VARCHAR (255) NOT NULL,
    CONSTRAINT processes_addons_pkey PRIMARY KEY (process_id ASC, addon ASC)
);



CREATE INDEX idx_processes_addons_pid
    ON processes_addons(process_id ASC);



CREATE TABLE processes_roles (
    process_id VARCHAR (255) NOT NULL,
    role       VARCHAR (255) NOT NULL,
    CONSTRAINT processes_roles_pkey PRIMARY KEY (process_id ASC, role ASC)
);



CREATE INDEX idx_processes_roles_pid
    ON processes_roles(process_id ASC);



CREATE TABLE tasks (
    id                       VARCHAR (255)      NOT NULL,
    actual_owner             VARCHAR (255)      NULL,
    completed                DATETIMEOFFSET (6) NULL,
    description              VARCHAR (255)      NULL,
    endpoint                 VARCHAR (255)      NULL,
    inputs                   NVARCHAR (MAX)     NULL,
    last_update              DATETIMEOFFSET (6) NULL,
    name                     VARCHAR (255)      NULL,
    outputs                  NVARCHAR (MAX)     NULL,
    priority                 VARCHAR (255)      NULL,
    process_id               VARCHAR (255)      NULL,
    process_instance_id      VARCHAR (255)      NULL,
    reference_name           VARCHAR (255)      NULL,
    root_process_id          VARCHAR (255)      NULL,
    root_process_instance_id VARCHAR (255)      NULL,
    started                  DATETIMEOFFSET (6) NULL,
    state                    VARCHAR (255)      NULL,
    external_reference_id    VARCHAR (4000)     NULL,
    sla_due_date             DATETIMEOFFSET (6) NULL,
    CONSTRAINT tasks_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_tasks_piid
    ON tasks(process_instance_id ASC);



CREATE TABLE tasks_admin_groups (
    task_id  VARCHAR (255) NOT NULL,
    group_id VARCHAR (255) NOT NULL,
    CONSTRAINT tasks_admin_groups_pkey PRIMARY KEY (task_id ASC, group_id ASC)
);



CREATE INDEX idx_tasks_admin_groups_tid
    ON tasks_admin_groups(task_id ASC);



CREATE TABLE tasks_admin_users (
    task_id VARCHAR (255) NOT NULL,
    user_id VARCHAR (255) NOT NULL,
    CONSTRAINT tasks_admin_users_pkey PRIMARY KEY (task_id ASC, user_id ASC)
);



CREATE INDEX idx_tasks_admin_users_tid
    ON tasks_admin_users(task_id ASC);



CREATE TABLE tasks_excluded_users (
    task_id VARCHAR (255) NOT NULL,
    user_id VARCHAR (255) NOT NULL,
    CONSTRAINT tasks_excluded_users_pkey PRIMARY KEY (task_id ASC, user_id ASC)
);



CREATE INDEX idx_tasks_excluded_users_tid
    ON tasks_excluded_users(task_id ASC);



CREATE TABLE tasks_potential_groups (
    task_id  VARCHAR (255) NOT NULL,
    group_id VARCHAR (255) NOT NULL,
    CONSTRAINT tasks_potential_groups_pkey PRIMARY KEY (task_id ASC, group_id ASC)
);



CREATE INDEX idx_tasks_potential_groups_tid
    ON tasks_potential_groups(task_id ASC);



CREATE TABLE tasks_potential_users (
    task_id VARCHAR (255) NOT NULL,
    user_id VARCHAR (255) NOT NULL,
    CONSTRAINT tasks_potential_users_pkey PRIMARY KEY (task_id ASC, user_id ASC)
);



CREATE INDEX idx_tasks_potential_users_tid
    ON tasks_potential_users(task_id ASC);



ALTER TABLE nodes
    ADD DEFAULT ((0)) FOR retrigger;



ALTER TABLE attachments
    ADD CONSTRAINT fk_attachments_tasks FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE;



ALTER TABLE comments
    ADD CONSTRAINT fk_comments_tasks FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE;



ALTER TABLE definitions_addons
    ADD CONSTRAINT fk_definitions_addons_definitions FOREIGN KEY (process_id, process_version) REFERENCES process_definitions (id, version) ON DELETE CASCADE;



ALTER TABLE definitions_annotations
    ADD CONSTRAINT fk_definitions_annotations FOREIGN KEY (process_id, process_version) REFERENCES process_definitions (id, version) ON DELETE CASCADE;



ALTER TABLE definitions_nodes
    ADD CONSTRAINT fk_definitions_nodes_definitions FOREIGN KEY (process_id, process_version) REFERENCES process_definitions (id, version) ON DELETE CASCADE;



ALTER TABLE definitions_nodes_metadata
    ADD CONSTRAINT fk_definitions_nodes_metadata_definitions_nodes FOREIGN KEY (node_id, process_id, process_version) REFERENCES definitions_nodes (id, process_id, process_version) ON DELETE CASCADE;



ALTER TABLE definitions_roles
    ADD CONSTRAINT fk_definitions_roles_definitions FOREIGN KEY (process_id, process_version) REFERENCES process_definitions (id, version) ON DELETE CASCADE;



ALTER TABLE milestones
    ADD CONSTRAINT fk_milestones_process FOREIGN KEY (process_instance_id) REFERENCES processes (id) ON DELETE CASCADE;



ALTER TABLE nodes
    ADD CONSTRAINT fk_nodes_process FOREIGN KEY (process_instance_id) REFERENCES processes (id) ON DELETE CASCADE;



ALTER TABLE processes_addons
    ADD CONSTRAINT fk_processes_addons_processes FOREIGN KEY (process_id) REFERENCES processes (id) ON DELETE CASCADE;



ALTER TABLE processes_roles
    ADD CONSTRAINT fk_processes_roles_processes FOREIGN KEY (process_id) REFERENCES processes (id) ON DELETE CASCADE;



ALTER TABLE tasks_admin_groups
    ADD CONSTRAINT fk_tasks_admin_groups_tasks FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE;



ALTER TABLE tasks_admin_users
    ADD CONSTRAINT fk_tasks_admin_users_tasks FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE;



ALTER TABLE tasks_excluded_users
    ADD CONSTRAINT fk_tasks_excluded_users_tasks FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE;



ALTER TABLE tasks_potential_groups
    ADD CONSTRAINT fk_tasks_potential_groups_tasks FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE;



ALTER TABLE tasks_potential_users
    ADD CONSTRAINT fk_tasks_potential_users_tasks FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE;
