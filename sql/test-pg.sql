SELECT * FROM test_table WHERE agent_id = 1000 and date > now() - interval '30 day' ORDER BY date DESC;
