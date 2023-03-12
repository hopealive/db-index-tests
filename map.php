<?php

$startText = 'INSERT INTO test_table (agent_id, pack, state, date, last_changed) VALUES ';
$tmpl = '(%d, %d, %s, now(), now())';
for ($i = 1; $i <= 1000; ++$i) {
    $values = [];
    for ($j = 1; $j <= 1000; ++$j) {
        $values[] = sprintf($tmpl, $i, $j, "'wip'");
    }
    $blocks[] = $startText . implode(", \n", $values) . "; \n";
}
file_put_contents('sql/data.sql', implode(' ', $blocks));
