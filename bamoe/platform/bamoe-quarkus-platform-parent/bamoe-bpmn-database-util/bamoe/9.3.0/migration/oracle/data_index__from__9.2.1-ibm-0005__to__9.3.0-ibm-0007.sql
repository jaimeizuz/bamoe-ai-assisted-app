-- This file contains SQL statements to migrate BAMOE from
-- 9.2.1-ibm-0005 to 9.3.0-ibm-0007.
-- 
-- It is created by combining multiple individual migration
-- scripts that were written during the development of BAMOE.
-- 
-- The names of the individual scripts are for reference only
-- and do not contain any special meaning other than the order
-- which they were created.




-- V1.45.1.3__add_cancelled_type_nodes_oracle_bamoe930.sql (BEGIN)


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

ALTER TABLE nodes ADD cancel_type varchar2 (255);


-- V1.45.1.3__add_cancelled_type_nodes_oracle_bamoe930.sql (END)


-- V1.45.1.4__add_indexes_for_jobs_and_tasks.sql (BEGIN)


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

CREATE INDEX idx_jobs_piid ON jobs btree (process_instance_id);
CREATE INDEX idx_tasks_piid ON tasks btree (process_instance_id);


-- V1.45.1.4__add_indexes_for_jobs_and_tasks.sql (END)
