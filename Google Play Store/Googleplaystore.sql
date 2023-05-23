/*Total Number of rows*/
SELECT COUNT(*) as total_rows,
Count("Rating") as non_empty_rows,
(Count(*)) - COUNT("Rating") AS empty_rows,
(COUNT("Rating") / COUNT(*)::float) * 100 AS percentage_empty
FROM googleplaystore


