


CREATE TABLE jbpm_user_tasks (
    id                    VARCHAR (50)  NOT NULL,
    user_task_id          VARCHAR (255) NULL,
    task_priority         VARCHAR (50)  NULL,
    actual_owner          VARCHAR (255) NULL,
    task_description      VARCHAR (255) NULL,
    status                VARCHAR (255) NULL,
    termination_type      VARCHAR (255) NULL,
    external_reference_id VARCHAR (255) NULL,
    task_name             VARCHAR (255) NULL,
    CONSTRAINT jbpm_user_tasks_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_usertasks_tid
    ON jbpm_user_tasks(user_task_id ASC);



CREATE TABLE jbpm_user_tasks_admin_groups (
    task_id  VARCHAR (50)  NOT NULL,
    group_id VARCHAR (255) NOT NULL,
    CONSTRAINT jbpm_user_tasks_admin_groups_pkey PRIMARY KEY (task_id ASC, group_id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_admin_groups_tid
    ON jbpm_user_tasks_admin_groups(task_id ASC);



CREATE INDEX idx_jbpm_user_tasks_admin_groups_gid
    ON jbpm_user_tasks_admin_groups(group_id ASC);



CREATE TABLE jbpm_user_tasks_admin_users (
    task_id VARCHAR (50)  NOT NULL,
    user_id VARCHAR (255) NOT NULL,
    CONSTRAINT jbpm_user_tasks_admin_users_pkey PRIMARY KEY (task_id ASC, user_id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_admin_users_tid
    ON jbpm_user_tasks_admin_users(task_id ASC);



CREATE INDEX idx_jbpm_user_tasks_admin_users_uid
    ON jbpm_user_tasks_admin_users(user_id ASC);



CREATE TABLE jbpm_user_tasks_attachments (
    id         VARCHAR (50)  NOT NULL,
    name       VARCHAR (255) NULL,
    updated_by VARCHAR (255) NULL,
    updated_at DATETIME2 (6) NULL,
    url        VARCHAR (255) NULL,
    task_id    VARCHAR (50)  NOT NULL,
    CONSTRAINT jbpm_user_tasks_attachments_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_attachments_tid
    ON jbpm_user_tasks_attachments(task_id ASC);



CREATE TABLE jbpm_user_tasks_comments (
    id         VARCHAR (50)   NOT NULL,
    updated_by VARCHAR (255)  NULL,
    updated_at DATETIME2 (6)  NULL,
    comment    VARCHAR (1000) NULL,
    task_id    VARCHAR (50)   NOT NULL,
    CONSTRAINT jbpm_user_tasks_comments_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_comments_tid
    ON jbpm_user_tasks_comments(task_id ASC);



CREATE TABLE jbpm_user_tasks_deadline (
    id                 INT             NOT NULL,
    task_id            VARCHAR (50)    NOT NULL,
    notification_type  VARCHAR (255)   NOT NULL,
    notification_value VARBINARY (MAX) NULL,
    java_type          VARCHAR (255)   NULL,
    CONSTRAINT jbpm_user_tasks_deadline_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_deadline_tid
    ON jbpm_user_tasks_deadline(task_id ASC);



CREATE TABLE jbpm_user_tasks_deadline_timer (
    task_id             VARCHAR (50)    NOT NULL,
    notification_job_id VARCHAR (255)   NOT NULL,
    notification_type   VARCHAR (255)   NOT NULL,
    notification_value  VARBINARY (MAX) NULL,
    java_type           VARCHAR (255)   NULL,
    CONSTRAINT jbpm_user_tasks_deadline_timer_pkey PRIMARY KEY (task_id ASC, notification_job_id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_deadline_timer_jid
    ON jbpm_user_tasks_deadline_timer(notification_job_id ASC);



CREATE INDEX idx_jbpm_user_tasks_deadline_timer_tid
    ON jbpm_user_tasks_deadline_timer(task_id ASC);



CREATE TABLE jbpm_user_tasks_excluded_users (
    task_id VARCHAR (50)  NOT NULL,
    user_id VARCHAR (255) NOT NULL,
    CONSTRAINT jbpm_user_tasks_excluded_users_pkey PRIMARY KEY (task_id ASC, user_id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_excluded_users_uid
    ON jbpm_user_tasks_excluded_users(user_id ASC);



CREATE INDEX idx_jbpm_user_tasks_excluded_users_tid
    ON jbpm_user_tasks_excluded_users(task_id ASC);



CREATE TABLE jbpm_user_tasks_inputs (
    task_id     VARCHAR (50)    NOT NULL,
    input_name  VARCHAR (255)   NOT NULL,
    input_value VARBINARY (MAX) NULL,
    java_type   VARCHAR (255)   NULL,
    CONSTRAINT jbpm_user_tasks_inputs_pkey PRIMARY KEY (task_id ASC, input_name ASC)
);



CREATE INDEX idx_jbpm_user_tasks_inputs_tid
    ON jbpm_user_tasks_inputs(task_id ASC);



CREATE TABLE jbpm_user_tasks_metadata (
    task_id        VARCHAR (50)  NOT NULL,
    metadata_name  VARCHAR (255) NOT NULL,
    metadata_value VARCHAR (512) NULL,
    java_type      VARCHAR (255) NULL,
    CONSTRAINT jbpm_user_tasks_metadata_pkey PRIMARY KEY (task_id ASC, metadata_name ASC)
);



CREATE INDEX idx_jbpm_user_tasks_metadata_tid
    ON jbpm_user_tasks_metadata(task_id ASC);



CREATE TABLE jbpm_user_tasks_outputs (
    task_id      VARCHAR (50)    NOT NULL,
    output_name  VARCHAR (255)   NOT NULL,
    output_value VARBINARY (MAX) NULL,
    java_type    VARCHAR (255)   NULL,
    CONSTRAINT jbpm_user_tasks_outputs_pkey PRIMARY KEY (task_id ASC, output_name ASC)
);



CREATE INDEX idx_jbpm_user_tasks_outputs_tid
    ON jbpm_user_tasks_outputs(task_id ASC);



CREATE TABLE jbpm_user_tasks_potential_groups (
    task_id  VARCHAR (50)  NOT NULL,
    group_id VARCHAR (255) NOT NULL,
    CONSTRAINT jbpm_user_tasks_potential_groups_pkey PRIMARY KEY (task_id ASC, group_id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_potential_groups_gid
    ON jbpm_user_tasks_potential_groups(group_id ASC);



CREATE INDEX idx_jbpm_user_tasks_potential_groups_tid
    ON jbpm_user_tasks_potential_groups(task_id ASC);



CREATE TABLE jbpm_user_tasks_potential_users (
    task_id VARCHAR (50)  NOT NULL,
    user_id VARCHAR (255) NOT NULL,
    CONSTRAINT jbpm_user_tasks_potential_users_pkey PRIMARY KEY (task_id ASC, user_id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_potential_users_uid
    ON jbpm_user_tasks_potential_users(user_id ASC);



CREATE INDEX idx_jbpm_user_tasks_potential_users_tid
    ON jbpm_user_tasks_potential_users(task_id ASC);



CREATE TABLE jbpm_user_tasks_reassignment (
    id                 INT             NOT NULL,
    task_id            VARCHAR (50)    NOT NULL,
    reassignment_type  VARCHAR (255)   NOT NULL,
    reassignment_value VARBINARY (MAX) NULL,
    java_type          VARCHAR (255)   NULL,
    CONSTRAINT jbpm_user_tasks_reassignment_pkey PRIMARY KEY (id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_reassignment_tid
    ON jbpm_user_tasks_reassignment(task_id ASC);



CREATE TABLE jbpm_user_tasks_reassignment_timer (
    task_id             VARCHAR (50)    NOT NULL,
    reassignment_job_id VARCHAR (255)   NOT NULL,
    reassignment_type   VARCHAR (255)   NOT NULL,
    reassignment_value  VARBINARY (MAX) NULL,
    java_type           VARCHAR (255)   NULL,
    CONSTRAINT jbpm_user_tasks_reassignment_timer_pkey PRIMARY KEY (task_id ASC, reassignment_job_id ASC)
);



CREATE INDEX idx_jbpm_user_tasks_reassignment_timer_jid
    ON jbpm_user_tasks_reassignment_timer(reassignment_job_id ASC);



CREATE INDEX idx_jbpm_user_tasks_reassignment_timer_tid
    ON jbpm_user_tasks_reassignment_timer(task_id ASC);



CREATE SEQUENCE jbpm_user_tasks_deadline_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



CREATE SEQUENCE jbpm_user_tasks_reassignment_seq
    AS BIGINT
    START WITH 1
    INCREMENT BY 50
    CACHE 50;



ALTER TABLE jbpm_user_tasks_admin_groups
    ADD CONSTRAINT fk_jbpm_user_tasks_admin_groups_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_admin_users
    ADD CONSTRAINT fk_jbpm_user_tasks_admin_users_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_attachments
    ADD CONSTRAINT fk_user_tasks_attachments_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_comments
    ADD CONSTRAINT fk_user_tasks_comments_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_deadline
    ADD CONSTRAINT fk_jbpm_user_tasks_deadline_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_deadline_timer
    ADD CONSTRAINT fk_jbpm_user_tasks_deadline_timer_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_excluded_users
    ADD CONSTRAINT fk_jbpm_user_tasks_excluded_users_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_inputs
    ADD CONSTRAINT fk_jbpm_user_tasks_inputs_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_metadata
    ADD CONSTRAINT fk_jbpm_user_tasks_metadata_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_outputs
    ADD CONSTRAINT fk_jbpm_user_tasks_outputs_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_potential_groups
    ADD CONSTRAINT fk_jbpm_user_tasks_potential_groups_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_potential_users
    ADD CONSTRAINT fk_jbpm_user_fk_tasks_potential_users_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_reassignment
    ADD CONSTRAINT fk_jbpm_user_tasks_reassignment_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;



ALTER TABLE jbpm_user_tasks_reassignment_timer
    ADD CONSTRAINT fk_jbpm_user_tasks_reassignment_timer_tid FOREIGN KEY (task_id) REFERENCES jbpm_user_tasks (id) ON DELETE CASCADE;
