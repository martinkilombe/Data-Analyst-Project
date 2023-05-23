/*Total Number of empty Rating rows*/
SELECT COUNT(*) as total_rows,
Count("Rating") as non_empty_rows,
(Count(*)) - COUNT("Rating") AS empty_rows,
(COUNT(*) - COUNT("Rating")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore

/*Total Number of empty Reviews rows-- No empty Rows*/
SELECT COUNT(*) as total_rows,
Count("Reviews") as non_empty_rows,
(Count(*)) - COUNT("Reviews") AS empty_rows,
(COUNT(*) - COUNT("Reviews")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore

/*Total Number of empty Category rows-- No empty Rows*/
SELECT COUNT(*) as total_rows,
Count("Category") as non_empty_rows,
(Count(*)) - COUNT("Category") AS empty_rows,
(COUNT(*) - COUNT("Category")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore

/*Total Number of empty Rating rows*/
SELECT COUNT(*) as total_rows,
Count("Rating") as non_empty_rows,
(Count(*)) - COUNT("Rating") AS empty_rows,
(COUNT(*) - COUNT("Rating")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore