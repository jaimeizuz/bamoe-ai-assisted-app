
-- DROP TABLE process_paas.pr_paas_user_task; 


CREATE TABLE process_paas.pr_paas_user_task ( 

id bigserial NOT NULL, 

catalog_id int4 NULL, 

user_task_instance_id varchar(255) NOT NULL, 

process_instance_id varchar(255) NOT NULL, 

realm varchar(255) NULL, 

start_ts timestamp NULL, 

case_id int4 NULL, 

actual_owner varchar(255) NULL, 

lock_ts timestamp NULL, 

assigned_user varchar(255) NULL, 

sla timestamp NULL, 

creation_center_id varchar(255) NULL, 

json jsonb NULL, 

working_task_mode varchar(255) NOT NULL, 

entity_id varchar(4) NULL, 

process_id int4 NULL, 

CONSTRAINT pr_paas_user_task_pkey PRIMARY KEY (id), 

CONSTRAINT pr_paas_user_task_uq UNIQUE (user_task_instance_id, process_instance_id) 

); 

 

-- process_paas.pr_paas_user_task_access_point definition 

 

-- Drop table 

 

-- DROP TABLE process_paas.pr_paas_user_task_access_point; 

 

CREATE TABLE process_paas.pr_paas_user_task_access_point ( 

id_user_task int8 NOT NULL, 

id_access_point int8 NOT NULL, 

CONSTRAINT pr_paas_user_task_access_point_pkey PRIMARY KEY (id_user_task, id_access_point), 

CONSTRAINT pr_paas_user_task_access_point_id_access_point_fkey FOREIGN KEY (id_access_point) REFERENCES process_paas.pr_paas_access_point(id_access_point), 

CONSTRAINT pr_paas_user_task_access_point_id_user_task_fkey FOREIGN KEY (id_user_task) REFERENCES process_paas.pr_paas_user_task(id) ON DELETE CASCADE 

); 

 

-- process_paas.pr_paas_user_task_center definition 

 

-- Drop table 

 

-- DROP TABLE process_paas.pr_paas_user_task_center; 

 

CREATE TABLE process_paas.pr_paas_user_task_center ( 

id_user_task int8 NOT NULL, 

center varchar(4) NOT NULL, 

CONSTRAINT pr_paas_user_task_center_pkey PRIMARY KEY (id_user_task, center), 

CONSTRAINT pr_paas_user_task_center_id_user_task_fkey FOREIGN KEY (id_user_task) REFERENCES process_paas.pr_paas_user_task(id) ON DELETE CASCADE 

); 

 

-- process_paas.pr_paas_user_task_client definition 

 

-- Drop table 

 

-- DROP TABLE process_paas.pr_paas_user_task_client; 

 

CREATE TABLE process_paas.pr_paas_user_task_client ( 

id_user_task int8 NOT NULL, 

id_client varchar(255) NOT NULL, 

CONSTRAINT pr_paas_user_task_client_pkey PRIMARY KEY (id_user_task, id_client), 

CONSTRAINT pr_paas_user_task_client_id_user_task_fkey FOREIGN KEY (id_user_task) REFERENCES process_paas.pr_paas_user_task(id) ON DELETE CASCADE 

); 

 

-- process_paas.pr_paas_user_task_group definition 

 

-- Drop table 

 

-- DROP TABLE process_paas.pr_paas_user_task_group; 

 

CREATE TABLE process_paas.pr_paas_user_task_group ( 

id_user_task int8 NOT NULL, 

group_name varchar(255) NOT NULL, 

CONSTRAINT pr_paas_user_task_groups_pkey PRIMARY KEY (id_user_task, group_name), 

CONSTRAINT pr_paas_user_task_group_id_user_task_fkey FOREIGN KEY (id_user_task) REFERENCES process_paas.pr_paas_user_task(id) ON DELETE CASCADE 

); 