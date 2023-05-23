/*DATA CLEANING*/
SELECT * FROM googleplaystore;
/*Total Number of empty App rows -- No empty App Rows*/
SELECT COUNT(*) as total_rows,
Count("App") as non_empty_rows,
(Count(*)) - COUNT("App") AS empty_rows,
(COUNT(*) - COUNT("App")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*Total Number of empty Category rows-- No empty Rows*/
SELECT COUNT(*) as total_rows,
Count("Category") as non_empty_rows,
(Count(*)) - COUNT("Category") AS empty_rows,
(COUNT(*) - COUNT("Category")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*Total Number of empty Rating rows*/
SELECT COUNT(*) as total_rows,
Count("Rating") as non_empty_rows,
(Count(*)) - COUNT("Rating") AS empty_rows,
(COUNT(*) - COUNT("Rating")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*Total Number of empty Reviews rows-- No empty Rows*/
SELECT COUNT(*) as total_rows,
Count("Reviews") as non_empty_rows,
(Count(*)) - COUNT("Reviews") AS empty_rows,
(COUNT(*) - COUNT("Reviews")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*Total Number of empty Size rows-- No empty App Rows*/
SELECT COUNT(*) as total_rows,
Count("Size") as non_empty_rows,
(Count(*)) - COUNT("Size") AS empty_rows,
(COUNT(*) - COUNT("Size")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*Total Number of empty Installs rows-- No empty App Rows*/
SELECT COUNT(*) as total_rows,
Count("Installs") as non_empty_rows,
(Count(*)) - COUNT("Installs") AS empty_rows,
(COUNT(*) - COUNT("Installs")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*Total Number of empty Type rows*/
SELECT COUNT(*) as total_rows,
Count("Type") as non_empty_rows,
(Count(*)) - COUNT("Type") AS empty_rows,
(COUNT(*) - COUNT("Type")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*Total Number of empty Price rows*/
SELECT COUNT(*) as total_rows,
Count("Price") as non_empty_rows,
(Count(*)) - COUNT("Price") AS empty_rows,
(COUNT(*) - COUNT("Price")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;


/*Total Number of empty Content_Rating rows*/
SELECT COUNT(*) as total_rows,
Count("Content_Rating") as non_empty_rows,
(Count(*)) - COUNT("Content_Rating") AS empty_rows,
(COUNT(*) - COUNT("Content_Rating")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*Total Number of empty Genres rows*/
SELECT COUNT(*) as total_rows,
Count("Genres") as non_empty_rows,
(Count(*)) - COUNT("Genres") AS empty_rows,
(COUNT(*) - COUNT("Genres")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;


/*Total Number of empty Last_Updated rows */
SELECT COUNT(*) as total_rows,
Count("Last_Updated") as non_empty_rows,
(Count(*)) - COUNT("Last_Updated") AS empty_rows,
(COUNT(*) - COUNT("Last_Updated")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;


/*Total Number of empty Current_Version rows*/
SELECT COUNT(*) as total_rows,
Count("Current_Version") as non_empty_rows,
(Count(*)) - COUNT("Current_Version") AS empty_rows,
(COUNT(*) - COUNT("Current_Version")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*Total Number of empty Android_Version rows*/
SELECT COUNT(*) as total_rows,
Count("Android_Version") as non_empty_rows,
(Count(*)) - COUNT("Android_Version") AS empty_rows,
(COUNT(*) - COUNT("Android_Version")::float)*100/COUNT(*) as percentage_empty_rows
FROM googleplaystore;

/*#checking for the percentage or number of missing rows in each Column and determine whether to drop the NULLS , or fill the NULLS 
- Ratings has 13.59% NULL entries
- Type had 1 missing/NULL entry
- Price had 1 missing /NULL entry
- Content_rating had 1 missing /NULL entry
- Last_updated had 1 missing /NULL entry
- Current_version 8 missing /NULL entry
- Android_version 8 missing /NULL entry */

/*Dropping the above NULL/empty cells so as to increase the quality of our data --- DELETE 1481 entries*/
DELETE FROM googleplaystore
WHERE "Rating" IS NULL OR "Type" IS NULL OR "Price" IS NULL OR "Content_Rating" IS NULL OR "Last_Updated" IS NULL OR "Current_Version" IS NULL OR "Android_Version" IS NULL;

/*SIZE Column - Remove the Ms and convert to millions(x1000000), remove the K and convert to thousands(x1000)*/
UPDATE googleplaystore
SET "Size" = CAST(REPLACE("Size", 'M', '') AS DECIMAL(18, 2)) * 1000000
WHERE "Size" LIKE '%M';

UPDATE googleplaystore
SET "Size" = CAST(REPLACE("Size", 'k', '') AS DECIMAL(18, 2)) * 1000
WHERE "Size" LIKE '%k';

/* Installs column -- Removing the commas(,) from the numbers*/
UPDATE googleplaystore
SET "Size" = REPLACE("Size", ',', '')
WHERE "Size" LIKE '%,%';
