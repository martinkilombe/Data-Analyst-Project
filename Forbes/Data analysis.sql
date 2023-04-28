SELECT * FROM forbes_financials.`forbes global 2022(2000 companies) - companies`;

#Data cleaning
#Reformating the data -- removing the 'B' and 'M' and using numbers only
#1. SALES
#Remove the "M" for millions and replace with "B" for Billions after converting it to billions
UPDATE forbes_financials.`forbes global 2022(2000 companies) - companies`
SET sales = CONCAT(ROUND(REPLACE(REPLACE(TRIM(REPLACE(sales, '$', '')), 'M', ''), ' ', '') * 0.001, 3), 'B')
WHERE sales LIKE '%$%M%';

#Checking whether all varchar with 'M' have been replaced with 'B', no Ms left
SELECT sales FROM forbes_financials.`forbes global 2022(2000 companies) - companies`
WHERE sales LIKE "%M%";
#Removing the Bs and white spaces to get the varchar 
UPDATE forbes_financials.`forbes global 2022(2000 companies) - companies`
SET sales = replace(replace(trim(replace(sales, '$', '')), 'B', ''), ' ', '');

#2. Profit
#Remove the "M" for millions and replace with "B" for Billions after converting it to billions
UPDATE forbes_financials.`forbes global 2022(2000 companies) - companies`
SET profit = CONCAT(ROUND(REPLACE(REPLACE(TRIM(REPLACE(profit, '$', '')), 'M', ''), ' ', '') * 0.001, 3), 'B')
WHERE profit LIKE '%$%M%';
#Removing the Bs and white spaces to get the varchar 
UPDATE forbes_financials.`forbes global 2022(2000 companies) - companies`
SET profit = replace(replace(trim(replace(profit, '$', '')), 'B', ''), ' ', '');

#3. assets
#Remove the "M" for millions and replace with "B" for Billions after converting it to billions
#Remove the "M" for millions and replace with "B" for Billions after converting it to billions
UPDATE forbes_financials.`forbes global 2022(2000 companies) - companies`
SET assets = CONCAT(ROUND(REPLACE(REPLACE(TRIM(REPLACE(assets, '$', '')), 'M', ''), ' ', '') * 0.001, 3), 'B')
WHERE assets LIKE '%$%M%';
#Removing the Bs and white spaces to get the varchar 
UPDATE forbes_financials.`forbes global 2022(2000 companies) - companies`
SET assets = replace(replace(trim(replace(assets, '$', '')), 'B', ''), ' ', '');

#4. market_value
#Remove the "M" for millions and replace with "B" for Billions after converting it to billions
#Remove the "M" for millions and replace with "B" for Billions after converting it to billions
UPDATE forbes_financials.`forbes global 2022(2000 companies) - companies`
SET market_value = CONCAT(ROUND(REPLACE(REPLACE(TRIM(REPLACE(market_value, '$', '')), 'M', ''), ' ', '') * 0.001, 3), 'B')
WHERE market_value LIKE '%$%M%';
#Removing the Bs and white spaces to get the varchar 
UPDATE forbes_financials.`forbes global 2022(2000 companies) - companies`
SET market_value = replace(replace(trim(replace(market_value, '$', '')), 'B', ''), ' ', '');


#5.Basic Queries
#Arranging companies by country and sales in ascending order
SELECT * FROM forbes_financials.`forbes global 2022(2000 companies) - companies`
ORDER BY country, Sales ASC;

#Selecting the companies which have a large asset base compared to their market value
SELECT company, country , assets, market_value FROM forbes_financials.`forbes global 2022(2000 companies) - companies`
WHERE assets > market_value;
#Showing by what percentage the asset value is greater than the market_value
SELECT company, country , assets, market_value, (assets - market_value)*100 /market_value AS percentage_difference FROM forbes_financials.`forbes global 2022(2000 companies) - companies`
WHERE assets > market_value;

#Company where (profits + sales ) > asset base
SELECT * FROM forbes_financials.`forbes global 2022(2000 companies) - companies`
WHERE (sales + profit)/2 > assets;

#Arranging by columns that has the highest sales, profit, assets and market_value
SELECT * FROM forbes_financials.`forbes global 2022(2000 companies) - companies`
ORDER BY sales DESC, profit DESC,assets DESC , market_value DESC;














