-- This file contains SQL statements to migrate BAMOE from
-- 9.2.1-ibm-0005 to 9.3.0-ibm-0007.
-- 
-- It is created by combining multiple individual migration
-- scripts that were written during the development of BAMOE.
-- 
-- The names of the individual scripts are for reference only
-- and do not contain any special meaning other than the order
-- which they were created.




-- V1.0.3__jBPM_user_tasks_additional_indexes_sqlserver_bamoe930.sql (BEGIN)


/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

create index idx_usertasks_tid on jbpm_user_tasks(user_task_id);
create index idx_jbpm_user_tasks_deadline_tid on jbpm_user_tasks_deadline(task_id);
create index idx_jbpm_user_tasks_inputs_tid on jbpm_user_tasks_inputs(task_id);
create index idx_jbpm_user_tasks_outputs_tid on jbpm_user_tasks_outputs(task_id);
create index idx_jbpm_user_tasks_metadata_tid on jbpm_user_tasks_metadata(task_id);
create index idx_jbpm_user_tasks_admin_groups_tid on jbpm_user_tasks_admin_groups(task_id);
create index idx_jbpm_user_tasks_admin_groups_gid on jbpm_user_tasks_admin_groups(group_id);
create index idx_jbpm_user_tasks_admin_users_tid on jbpm_user_tasks_admin_users(task_id);
create index idx_jbpm_user_tasks_admin_users_uid on jbpm_user_tasks_admin_users(user_id);
create index idx_jbpm_user_tasks_attachments_tid on jbpm_user_tasks_attachments(task_id);
create index idx_jbpm_user_tasks_potential_groups_tid on jbpm_user_tasks_potential_groups(task_id);
create index idx_jbpm_user_tasks_potential_groups_gid on jbpm_user_tasks_potential_groups(group_id);
create index idx_jbpm_user_tasks_potential_users_tid on jbpm_user_tasks_potential_users(task_id);
create index idx_jbpm_user_tasks_potential_users_uid on jbpm_user_tasks_potential_users(user_id);
create index idx_jbpm_user_tasks_excluded_users_uid on jbpm_user_tasks_excluded_users(user_id);
create index idx_jbpm_user_tasks_excluded_users_tid on jbpm_user_tasks_excluded_users(task_id);


-- V1.0.3__jBPM_user_tasks_additional_indexes_sqlserver_bamoe930.sql (END)


-- V1.0.4__jBPM_user_tasks_add_missing_indexes.sql (BEGIN)


create index idx_jbpm_user_tasks_comments_tid on jbpm_user_tasks_comments(task_id);
create index idx_jbpm_user_tasks_reassignment_tid on jbpm_user_tasks_reassignment(task_id);
create index idx_jbpm_user_tasks_deadline_timer_tid on jbpm_user_tasks_deadline_timer(task_id);
create index idx_jbpm_user_tasks_deadline_timer_jid on jbpm_user_tasks_deadline_timer(notification_job_id);
create index idx_jbpm_user_tasks_reassignment_timer_tid on jbpm_user_tasks_reassignment_timer(task_id);
create index idx_jbpm_user_tasks_reassignment_timer_jid on jbpm_user_tasks_reassignment_timer(reassignment_job_id);

-- V1.0.4__jBPM_user_tasks_add_missing_indexes.sql (END)
