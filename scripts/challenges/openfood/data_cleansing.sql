openfood-production::DATABASE=> select imageable_id, count(*) from tmp_1056 group by imageable_id having count(*) > 1;
 imageable_id | count
--------------+-------
         1987 |     2
         1164 |     2
         2028 |     2
         1701 |     2
         2045 |     2
         1983 |     2
         2086 |     2
         7538 |     2
         2085 |     2
         2043 |     2
         1159 |     2
         1030 |     2
         1692 |     2
         2084 |     2
         1062 |     2
         2080 |     2
         2089 |     2
         2100 |     2
         1700 |     2
         2099 |     2
         2060 |     2
         1923 |     2
         1695 |     2
(23 rows)
