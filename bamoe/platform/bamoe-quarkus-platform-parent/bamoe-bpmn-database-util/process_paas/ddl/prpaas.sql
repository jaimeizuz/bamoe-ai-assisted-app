CREATE SCHEMA IF NOT EXISTS process_paas;

-- Sequences
CREATE SEQUENCE IF NOT EXISTS process_paas.pr_paas_access_point_sq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 NO CYCLE;
CREATE SEQUENCE IF NOT EXISTS process_paas.pr_paas_case_stage_tracker_sq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 NO CYCLE;
CREATE SEQUENCE IF NOT EXISTS process_paas.pr_paas_case_event_tracker_sq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 NO CYCLE;
CREATE SEQUENCE IF NOT EXISTS process_paas.pr_paas_case_status_tracker_sq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 NO CYCLE;
CREATE SEQUENCE IF NOT EXISTS process_paas.pr_paas_case_task_tracker_sq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 NO CYCLE;
CREATE SEQUENCE IF NOT EXISTS process_paas.pr_paas_process_case_new_id_case_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 NO CYCLE;
CREATE SEQUENCE IF NOT EXISTS process_paas.pr_paas_process_management_id_management_seq INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE;
CREATE SEQUENCE IF NOT EXISTS process_paas.pr_paas_massive_unlock_sq INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1 NO CYCLE;
-- Tables
CREATE TABLE IF NOT EXISTS process_paas.pr_paas_case_event_tracker (
	pr_case int8 NOT NULL DEFAULT nextval('process_paas.pr_paas_case_event_tracker_sq'::regclass),
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	id_center varchar(4) NOT NULL,
	id_event int4 NOT NULL,
	pr_event_trigger_accesspoint int4 NOT NULL,
	pr_event_data varchar(3200),
	pr_event_trigger_ts timestamp,
	pr_ap_device varchar(50),
	pr_ap_os varchar(50),
	pr_ap_type_user varchar(50),
	pr_ap_app varchar(50),
	event_tracker_id int4 NOT NULL,
	CONSTRAINT "EVENT_TRACKER_PK" PRIMARY KEY (id_center,pr_entity,pr_case,event_tracker_id)
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_case_stage_tracker (
	pr_case int8 NOT NULL DEFAULT nextval('process_paas.pr_paas_case_stage_tracker_sq'::regclass),
	pr_entity varchar(4) NOT NULL,
	id_process int4 NULL,
	id_center varchar(256) NOT NULL,
	pr_id_stage int4 NULL,
	pr_stage_start_user varchar(256) NULL,
	pr_stage_start_ts timestamp(6) NULL,
	pr_stage_accesspoint_start int4 NULL,
	pr_ap_type_user_start varchar(256) NULL,
	pr_ap_app_start varchar(256) NULL,
	pr_ap_device_start varchar(256) NULL,
	pr_ap_os_start varchar(256) NULL,
	pr_stage_end_user varchar(256) NULL,
	pr_stage_end_ts timestamp(6) NULL,
	pr_stage_accesspoint_end int4 NULL,
	pr_ap_type_user_end varchar(256) NULL,
	pr_ap_app_end varchar(256) NULL,
	pr_ap_device_end varchar(256) NULL,
	pr_ap_os_end varchar(256) NULL,
    pr_stage_time_spent       VARCHAR GENERATED ALWAYS AS (
        CASE
            WHEN pr_stage_end_ts IS NOT NULL AND pr_stage_start_ts IS NOT NULL THEN
                CAST(
                        CAST(FLOOR(DATE_PART('day', pr_stage_end_ts - pr_stage_start_ts)) AS TEXT) || ' ' ||
                        LPAD(CAST(FLOOR(DATE_PART('hour', pr_stage_end_ts - pr_stage_start_ts)::integer % 24) AS TEXT),
                             2, '') || ':' ||
                        LPAD(
                                CAST(FLOOR(DATE_PART('minute', pr_stage_end_ts - pr_stage_start_ts)::integer % 60) AS TEXT),
                                2, '') || ':' ||
                        LPAD(
                                CAST(FLOOR(DATE_PART('second', pr_stage_end_ts - pr_stage_start_ts)::integer % 60) AS TEXT),
                                2, '') || '.' ||
                        LPAD(CAST(FLOOR(DATE_PART('microsecond', pr_stage_end_ts - pr_stage_start_ts)::integer %
                                        1000000) AS TEXT), 3, '0')
                    AS VARCHAR)
            ELSE NULL
            END
        ) STORED,
	stage_tracker_id int4 NOT NULL,
    CONSTRAINT STAGE_TRACKER_PK PRIMARY KEY (pr_case, id_center, pr_entity, stage_tracker_id)
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_case_status_tracker (
	pr_case int8 NOT NULL DEFAULT nextval('process_paas.pr_paas_case_status_tracker_sq'::regclass),
	pr_entity varchar(4) NOT NULL,
	id_process int4 NULL,
	id_center varchar(256) NOT NULL,
	pr_status int4 NULL,
	is_final bool NULL,
	pr_status_start_user varchar(256) NULL,
	pr_status_start_ts timestamp(6) NULL,
	pr_status_accesspoint_start int4 NULL,
	pr_ap_type_user_start varchar(256) NULL,
	pr_ap_app_start varchar(256) NULL,
	pr_ap_device_start varchar(256) NULL,
	pr_ap_os_start varchar(256) NULL,
	pr_status_end_user varchar(256) NULL,
	pr_status_end_ts timestamp(6) NULL,
	pr_status_accesspoint_end int4 NULL,
	pr_ap_type_user_end varchar(256) NULL,
	pr_ap_app_end varchar(256) NULL,
	pr_ap_device_end varchar(256) NULL,
	pr_ap_os_end varchar(256) NULL,
    pr_status_time_spent VARCHAR GENERATED ALWAYS AS (
        CASE
            WHEN pr_status_end_ts IS NOT NULL AND pr_status_start_ts IS NOT NULL THEN
                CAST(
                        CAST(FLOOR(DATE_PART('day', pr_status_end_ts - pr_status_start_ts)) AS TEXT) || ' ' ||
                        LPAD(CAST(FLOOR(DATE_PART('hour', pr_status_end_ts - pr_status_start_ts)::integer % 24) AS TEXT),
                                2, '') || ':' ||
                        LPAD(CAST(FLOOR(DATE_PART('minute', pr_status_end_ts - pr_status_start_ts)::integer %
                                        60) AS TEXT), 2, '') || ':' ||
                        LPAD(CAST(FLOOR(DATE_PART('second', pr_status_end_ts - pr_status_start_ts)::integer %
                                        60) AS TEXT), 2, '') || '.' ||
                        LPAD(CAST(FLOOR(DATE_PART('microsecond', pr_status_end_ts - pr_status_start_ts)::integer %
                                        1000000) AS TEXT), 3, '0')
                    AS VARCHAR)
            ELSE NULL
            END
        ) STORED,
	status_tracker_id int4 NOT NULL,
    CONSTRAINT STATUS_TRACKER_PK PRIMARY KEY (pr_case, id_center, pr_entity, status_tracker_id)
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_case_task_tracker (
	pr_case int8 NOT NULL DEFAULT nextval('process_paas.pr_paas_case_task_tracker_sq'::regclass),
	pr_entity varchar(4) NOT NULL,
	id_process int4 NULL,
	id_center varchar(256) NOT NULL,
	id_task int4 NULL,
	pr_action int4 NULL,
	pr_audit_type varchar(256) NULL,
	pr_asignee varchar(256) NULL,
	pr_group int4 NULL,
	pr_task_start_user varchar(256) NULL,
	pr_task_start_ts timestamp(6) NULL,
	pr_task_accesspoint_start int4 NULL,
	pr_ap_type_user_start varchar(256) NULL,
	pr_ap_app_start varchar(256) NULL,
	pr_ap_device_start varchar(256) NULL,
	pr_ap_os_start varchar(256) NULL,
	pr_task_end_user varchar(256) NULL,
	pr_task_end_ts timestamp(6) NULL,
	pr_task_accesspoint_end int4 NULL,
	pr_ap_type_end varchar(256) NULL,
	pr_ap_app_end varchar(256) NULL,
	pr_ap_device_end varchar(256) NULL,
	pr_ap_os_end varchar(256) NULL,
    pr_task_time_spent VARCHAR GENERATED ALWAYS AS (
        CASE
            WHEN pr_task_end_ts IS NOT NULL AND pr_task_start_ts IS NOT NULL THEN
                CAST(
                        CAST(FLOOR(DATE_PART('day', pr_task_end_ts - pr_task_start_ts)) AS TEXT) || ' ' ||
                        LPAD(CAST(FLOOR(DATE_PART('hour', pr_task_end_ts - pr_task_start_ts)::integer % 24) AS TEXT), 2,
                             '') || ':' ||
                        LPAD(CAST(FLOOR(DATE_PART('minute', pr_task_end_ts - pr_task_start_ts)::integer % 60) AS TEXT),
                             2, '') || ':' ||
                        LPAD(CAST(FLOOR(DATE_PART('second', pr_task_end_ts - pr_task_start_ts)::integer % 60) AS TEXT),
                             2, '') || '.' ||
                        LPAD(CAST(FLOOR(DATE_PART('microsecond', pr_task_end_ts - pr_task_start_ts)::integer %
                                        1000000) AS TEXT), 3, '0')
                    AS VARCHAR)
            ELSE NULL
            END
        ) STORED,
	task_tracker_id int4 NOT NULL,
    CONSTRAINT TASK_TRACKER_PK PRIMARY KEY (pr_case, id_center, pr_entity, task_tracker_id)
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_case (
	id_case int8 NOT NULL DEFAULT nextval('process_paas.pr_paas_process_case_new_id_case_seq'::regclass),
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	pr_center varchar(4) NOT NULL,
	pr_stage int4 NULL,
	pr_status int4 NOT NULL,
	pr_ext_reference varchar(3200) NULL,
	pr_start_access_point int4 NOT NULL,
	pr_start_ts timestamp NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT process_case_pk PRIMARY KEY (id_case,pr_center,pr_entity,id_process)
);


CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process (
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	pr_name varchar(50) NULL,
	pr_description varchar(256) NULL,
	pr_owner varchar(50) NULL,
	pr_group varchar(50) NULL,
	is_reusable bool NULL,
	pr_end_dt timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT pr_paas_process_pkey PRIMARY KEY (id_process,pr_entity)
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process (
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	pr_name varchar(50) NULL,
	pr_description varchar(256) NULL,
	pr_owner varchar(50) NULL,
	pr_group varchar(50) NULL,
	is_reusable bool NULL,
	pr_end_dt timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT pr_paas_process_pkey PRIMARY KEY (id_process,pr_entity)
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_access_point (
	id_access_point int4 NOT NULL,
	id_process int4 NOT NULL,
	pr_entity varchar(4) NOT NULL,
	pr_end_dt timestamp(6) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT pr_paas_process_access_point_pk PRIMARY KEY (id_access_point, id_process, pr_entity),
	CONSTRAINT pr_paas_process_access_point_fk FOREIGN KEY (id_access_point) REFERENCES process_paas.pr_paas_access_point(id_access_point) ON DELETE CASCADE,
	CONSTRAINT pr_paas_process_access_point_fk_1 FOREIGN KEY (id_process,pr_entity) REFERENCES process_paas.pr_paas_process(id_process,pr_entity) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_case_historic (
                                                           	id_case int8 NOT NULL,
															pr_entity varchar(4) NOT NULL,
															id_process int4 NOT NULL,
															pr_center varchar(4) NOT NULL,
															pr_stage int4 NULL,
															pr_status int4 NOT NULL,
															pr_ext_reference varchar(3200) NULL,
															pr_start_access_point int4 NOT NULL,
															pr_start_ts timestamp NULL,
															pr_creation_user varchar(256) NULL,
															pr_modification_ts timestamp NULL,
															pr_modification_user varchar(256) NULL,
															pr_case_life_time int8 NULL GENERATED ALWAYS AS (
                                                CASE
                                                    WHEN pr_modification_ts IS NOT NULL AND pr_start_ts IS NOT NULL THEN
                                                    CAST(
                                                        FLOOR(DATE_PART('day', pr_modification_ts - pr_start_ts))::int8 *24*60*60*1000 +
                                                        FLOOR(DATE_PART('hour', pr_modification_ts - pr_start_ts)::int8 % 24) *60*60*1000 +
                                                        FLOOR(DATE_PART('minute', pr_modification_ts - pr_start_ts)::int8 % 60) *60*1000 +
                                                        FLOOR(DATE_PART('second', pr_modification_ts - pr_start_ts)::int8 % 60) *1000 +
                                                        case when FLOOR(DATE_PART('milliseconds', pr_modification_ts - pr_start_ts))::int8 > 500
                                                            then FLOOR(DATE_PART('milliseconds', pr_modification_ts - pr_start_ts))::int8 - 1000
                                                            else FLOOR(DATE_PART('milliseconds', pr_modification_ts - pr_start_ts))::int8
                                                            end
                                                        AS int8)
                                                        ELSE 0
                                                        END
                                                    ) STORED,
                                               CONSTRAINT pr_paas_process_case_historic_pkey PRIMARY KEY (id_case, pr_center, pr_entity, id_process)
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_event (
    pr_entity varchar(4) NOT NULL,
    id_process int4 NOT NULL,
    id_event int4 NOT NULL,
    pr_event_name varchar(25) NULL,
    pr_event_description varchar(256) NULL,
    pr_origin_app varchar(50) NULL,
    pr_end_dt timestamp(6) NULL,
    pr_start_ts timestamp(6) NULL,
    pr_creation_user varchar(256) NULL,
    pr_modification_ts timestamp(6) NULL,
    pr_modification_user varchar(256) NULL,
    CONSTRAINT pr_paas_process_event_pkey PRIMARY KEY (id_event, id_process, pr_entity)
);


CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_group (
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	id_group int4 NOT NULL,
	pr_group_name varchar(25) NULL,
	pr_group_description varchar(256) NULL,
	pr_end_dt timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT pr_paas_process_group_pkey PRIMARY KEY (id_group,id_process,pr_entity)
);


CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_management (
	id_management int8 NOT NULL DEFAULT nextval('process_paas.pr_paas_process_management_id_management_seq'::regclass),
	id_process int4 NOT NULL,
	pr_entity varchar(4) NOT NULL,
	dns varchar(200) NOT NULL,
	pr_realm varchar(100) NOT NULL,
	pr_start_ts timestamp NULL,
	pr_creation_user varchar(100) NULL,
	pr_modification_ts timestamp NULL,
	pr_modification_user varchar(100) NULL,
	CONSTRAINT process_management_pk PRIMARY KEY (id_management),
	CONSTRAINT process_management_un UNIQUE (id_process, pr_entity, dns)	
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_stage (
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	id_stage int4 NOT NULL,
	pr_stage_name varchar(25) NULL,
	pr_stage_description varchar(50) NULL,
	pr_end_dt timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT pr_paas_process_stage_pkey PRIMARY KEY (id_process,id_stage,pr_entity)
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_status (
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	id_status int4 NOT NULL,
	pr_status_name varchar(25) NULL,
	pr_status_description varchar(256) NULL,
	pr_status_type int4 NULL,
	pr_stage int4 NULL,
	pr_end_dt timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT pr_paas_process_status_pkey PRIMARY KEY (id_process,id_status,pr_entity)
);


CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_status_type (
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	id_status_type int4 NOT NULL,
	pr_type_name varchar(25) NULL,
	pr_type_description varchar(256) NULL,
	pr_end_dt timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT pr_paas_process_status_type_pkey PRIMARY KEY (id_process, id_status_type, pr_entity)
);

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_process_task (
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	id_task int4 NOT NULL,
	pr_task_name varchar(50) NULL,
	pr_task_description varchar(256) NULL,
	pr_task_link varchar(2048) NULL,
	type_task int4 NULL,
	pr_end_dt timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT pr_paas_process_task_pkey PRIMARY KEY (id_process,id_task,pr_entity)
);


CREATE TABLE IF NOT EXISTS process_paas.pr_paas_task_action (
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	id_action int4 NOT NULL,
	pr_action_name varchar(25) NULL,
	pr_action_description varchar(256) NULL,
	id_task int4 NULL,
	id_access_point int4 NULL,
	id_group int4 NULL,
	pr_end_dt timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT pr_paas_task_action_pkey PRIMARY KEY (id_action,id_process,pr_entity)
);


CREATE TABLE IF NOT EXISTS process_paas.pr_paas_user_group (
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	pr_group_id int4 NULL,
	pr_user_id varchar(256) NULL,
	pr_end_dt timestamp(6) NULL,
	pr_start_ts timestamp(6) NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_ts timestamp(6) NULL,
	pr_modification_user varchar(256) NULL,
	id_user_group int4 NOT NULL,
	CONSTRAINT pr_paas_user_group_pkey PRIMARY KEY (id_process,id_user_group,pr_entity)
);


CREATE TABLE IF NOT EXISTS process_paas.pr_paas_customer_case (
	id_case int8 NOT NULL,
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	pr_center varchar(4) NOT NULL,
	pr_customer_id varchar(256) NOT NULL,
	pr_start_ts timestamp NULL,
	pr_modification_ts timestamp NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT "CUSTOMER_CASE_PK" PRIMARY KEY (id_process, pr_entity, id_case, pr_customer_id, pr_center)
);


ALTER TABLE process_paas.pr_paas_customer_case ADD CONSTRAINT case_delete_customer_case_on_cascade FOREIGN KEY (id_case,pr_center,pr_entity,id_process) REFERENCES process_paas.pr_paas_process_case(id_case,pr_center,pr_entity,id_process) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS process_paas.pr_paas_customer_case_historic (
	id_case int8 NOT NULL,
	pr_entity varchar(4) NOT NULL,
	id_process int4 NOT NULL,
	pr_center varchar(4) NOT NULL,
	pr_customer_id varchar(256) NOT NULL,
	pr_start_ts timestamp NULL,
	pr_modification_ts timestamp NULL,
	pr_creation_user varchar(256) NULL,
	pr_modification_user varchar(256) NULL,
	CONSTRAINT "CUSTOMER_CASE_HISTORIC_PK" PRIMARY KEY (id_process, pr_entity, id_case, pr_customer_id, pr_center)
);


ALTER TABLE process_paas.pr_paas_customer_case_historic ADD CONSTRAINT case_delete_customer_historic_case_on_cascade FOREIGN KEY (id_case,pr_center,pr_entity,id_process) REFERENCES process_paas.pr_paas_process_case_historic(id_case,pr_center,pr_entity,id_process) ON DELETE CASCADE;



CREATE TABLE process_paas.pr_paas_massive_unlock (
	id int8 DEFAULT nextval('process_paas.pr_paas_massive_unlock_sq'::regclass) NOT NULL,
	engine_name varchar NULL,
	process_ids varchar NULL,
	unlocked_cases int4 NULL,
	pending_cases int4 NULL,
	start_ts timestamp NULL,
	end_ts timestamp NULL,
	time_spent varchar GENERATED ALWAYS AS (
CASE
    WHEN end_ts IS NOT NULL AND start_ts IS NOT NULL THEN ((((((((floor(date_part('day'::text, end_ts - start_ts))::text || ' '::text) || lpad(floor((date_part('hour'::text, end_ts - start_ts)::integer % 24)::double precision)::text, 2, ''::text)) || ':'::text) || lpad(floor((date_part('minute'::text, end_ts - start_ts)::integer % 60)::double precision)::text, 2, ''::text)) || ':'::text) || lpad(floor((date_part('second'::text, end_ts - start_ts)::integer % 60)::double precision)::text, 2, ''::text)) || '.'::text) || lpad(floor((date_part('microsecond'::text, end_ts - start_ts)::integer % 1000000)::double precision)::text, 3, '0'::text))::character varying
    ELSE NULL::character varying
END) STORED NULL,
	errors bool NULL,
	stopped_by_errors bool NULL,
	batch_size int4 NULL,
	max_threads int4 NULL,
	execution_type varchar NULL,
	avg_memory float4 NULL,
	reserved_timeout varchar NULL,
	cutoff_minutes int4 NULL,
	CONSTRAINT pr_paas_massive_unlock_pk PRIMARY KEY (id)
);
 
CREATE TABLE process_paas.pr_paas_massive_unlock_error (
	id int8 NOT NULL,
	error_log varchar NULL,
	case_id int8 NULL,
	error_ts varchar NULL,
	CONSTRAINT pr_paas_massive_unlock_error_pr_paas_massive_unlock_fk FOREIGN KEY (id) REFERENCES process_paas.pr_paas_massive_unlock(id)
);
 
CREATE TABLE process_paas.pr_paas_massive_unlock_lock (
	id varchar(100) NOT NULL,
	instance_id varchar(100) NULL,
	lock_time timestamp NULL,
	CONSTRAINT pr_paas_massive_unlock_lock_pkey PRIMARY KEY (id)
);