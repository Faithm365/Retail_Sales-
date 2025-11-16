SELECT * FROM `static-welder-478118-q7.Sales.Project` LIMIT 1000
--1. WHERE Clause
--Q1. Filter all transactions that occurred in the year 2023. Expected output: All --columns
SELECT
    MIN(DATE) AS Min_Date,
    MAX(DATE) AS Max_Date
FROM
    `static-welder-478118-q7.Sales.Project`;

SELECT
*
FROM
   `static-welder-478118-q7.Sales.Project`
   WHERE DATE BETWEEN '2023-01-01' AND '2024-01-01';
   --2. Filtering + Conditions
--Q2. Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset. Expected --output: All columns
SELECT
AVG(`TOTAL AMOUNT`) AS AVERAGE_TOTAL_AMOUNT
FROM
`static-welder-478118-q7.Sales.Project`;
SELECT
*
FROM
`static-welder-478118-q7.Sales.Project`
WHERE `TOTAL AMOUNT` > 455.999;
--3. Aggregate Functions
--Q3. Calculate the total revenue (sum of Total Amount). Expected output: Total_Revenue
SELECT
SUM(`TOTAL AMOUNT`)AS TOTAL_REVENUE
FROM
`static-welder-478118-q7.Sales.Project`;
--4. DISTINCT
--Q4. Display all distinct Product Categories in the dataset. Expected output: Product_Category
SELECT DISTINCT 
`PRODUCT CATEGORY`
FROM
`static-welder-478118-q7.Sales.Project`;
--5. GROUP BY
--Q5. For each Product Category, calculate the total quantity sold. Expected output: Product_Category, Total_Quantity
SELECT
`PRODUCT CATEGORY`,
SUM(QUANTITY ) AS TOTAL_QUANTITY
FROM
`static-welder-478118-q7.Sales.Project`
GROUP BY 
`PRODUCT CATEGORY`;
--6. CASE Statement
--Q6. Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’ (30–59), and ‘Senior’ (60+). --Expected output: Customer_ID, Age, Age_Group

SELECT
    `CUSTOMER ID`,
    AGE,
    CASE
        WHEN AGE < 30 THEN 'YOUTH'
        WHEN AGE BETWEEN 30 AND 59 THEN 'ADULT'
        WHEN AGE > 60 THEN 'SENIOR'
        ELSE 'UNKNOWN'
    END AS `AGE GROUP`
FROM
    `static-welder-478118-q7.Sales.Project`;
    --Q7. For each Gender, count how many high-value transactions occurred (where Total Amount > 500). Expected output: --Gender, High_Value_Transactions
   SELECT
   GENDER,
   SUM (`TOTAL AMOUNT`) AS HIGH_VALUE_TRANSACTIONS
   FROM
   `static-welder-478118-q7`.Sales.Project
   WHERE `TOTAL AMOUNT` > 500
   GROUP BY GENDER;
   --8. HAVING Clause
--Q8. For each Product Category, show only those categories where the total revenue exceeds 5,000. Expected output: --Product_Category, Total_Revenue
SELECT
`PRODUCT CATEGORY`,
SUM(`TOTAL AMOUNT`) AS TOTAL_REVENUE
FROM
`static-welder-478118-q7`.Sales.Project
GROUP BY `PRODUCT CATEGORY`
HAVING TOTAL_REVENUE > 5000;
--9. Calculated Fields
--Q9. Display a new column called Unit_Cost_Category that labels a transaction as: – 'Cheap' if Price per Unit < 50 – --'Moderate' if Price per Unit between 50 and 200 – 'Expensive' if Price per Unit > 200 Expected output: Transaction_ID, --Price_per_Unit, Unit_Cost_Category
SELECT
`TRANSACTION ID`,
`PRICE PER UNIT`,
CASE 
WHEN `PRICE PER UNIT` < 50 THEN 'CHEAP'
WHEN `PRICE PER UNIT` BETWEEN 50 AND 200 THEN 'MODERATE'
WHEN `PRICE PER UNIT` >200 THEN 'EXPENSIVE'
ELSE 'NOT_MARKED'
END AS UNIT_COST_CATEGORY
FROM `static-welder-478118-q7.Sales.Project`;
--10. Combining WHERE + CASE
--Q10. Display all transactions from customers aged 40 or older and add a column Spending_Level showing ‘High’ if Total --Amount > 1000, otherwise ‘Low’. Expected output: Customer_ID, Age, Total_Amount, Spending_Level
SELECT
    `CUSTOMER ID`,
    AGE,
    `TOTAL AMOUNT`,
    CASE
        WHEN `TOTAL AMOUNT` > 1000 THEN 'HIGH'
        ELSE 'LOW'
    END AS SPENDING_LEVEL
FROM
    `static-welder-478118-q7.Sales.Project`
WHERE
    AGE >= 40;
