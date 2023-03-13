DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  agent_id int(11) unsigned NOT NULL,
  pack int(11) unsigned NOT NULL,
  state enum('wip','preckecked') NOT NULL,
  date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_changed timestamp NULL DEFAULT NULL,
  KEY (agent_id, pack),
  KEY state (state),
  KEY date (date)
);

