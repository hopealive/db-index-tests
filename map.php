<?php

$startText = 'INSERT INTO test_table (id, agent_id, pack, state, date, last_changed) VALUES ';
$tmpl = '(%d, %d, %d, %s, now(), now())';

$g = 0;
for ($i = 1; $i <= 1000; ++$i) {
    $values = [];
    for ($j = 1; $j <= 1000; ++$j) {
        ++$g;
        $values[] = sprintf($tmpl, $g, $i, $j, "'wip'");
    }
    $blocks[] = $startText . implode(", \n", $values) . "; \n";
}
file_put_contents('sql/data.sql', implode(' ', $blocks));
