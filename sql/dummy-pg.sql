DROP TABLE IF EXISTS test_table;
CREATE TYPE stateEnum AS ENUM('wip','preckecked');
CREATE TABLE test_table (
  agent_id INTEGER NOT NULL,
  pack INTEGER NOT NULL,
  state stateEnum NOT NULL,
  date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_changed timestamp NULL DEFAULT NULL,

  PRIMARY KEY (agent_id, pack)
);


CREATE INDEX fk_test_table_state_idx ON test_table (state);
CREATE INDEX fk_test_table_date_idx ON test_table (date);
