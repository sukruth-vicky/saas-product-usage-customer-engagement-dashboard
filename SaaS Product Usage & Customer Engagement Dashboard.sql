CREATE DATABASE saas_product_analytics;

USE saas_product_analytics;

CREATE TABLE saas_usage (

    User_ID VARCHAR(10),
    Session_ID VARCHAR(10),
    Subscription_Type VARCHAR(20),
    Login_Date DATE,
    Session_Duration_Minutes INT,
    Feature_Used VARCHAR(50),
    Feature_Category VARCHAR(50),
    Device_Type VARCHAR(20),
    Country VARCHAR(30),
    Subscription_Status VARCHAR(20),
    Monthly_Revenue INT,
    Churn_Flag VARCHAR(10),
    Upgrade_Flag VARCHAR(10),
    Support_Tickets INT,
    User_Type VARCHAR(20),
    Login_Status VARCHAR(10),
    Feature_Usage_Status VARCHAR(10),
    Subscription_Active VARCHAR(10),
    Upgrade_Status VARCHAR(10)

);

SHOW TABLES;

DROP TABLE saas_usage;

SELECT COUNT(*) FROM saas_usage;

SELECT * FROM saas_usage;

DESCRIBE saas_usage;	

ALTER TABLE saas_usage
CHANGE COLUMN `ï»¿User_ID` User_ID TEXT;

SELECT COUNT(User_ID) AS Total_Users
FROM saas_usage;

SELECT COUNT(User_ID) AS Active_Users
FROM saas_usage
WHERE Subscription_Status = 'Active';

SELECT SUM(Monthly_Revenue) AS Total_Revenue
FROM saas_usage;

SELECT 
ROUND(
COUNT(CASE WHEN Churn_Flag = 'Yes' THEN 1 END) * 100.0
/
COUNT(*),
2
) AS Churn_Rate
FROM saas_usage;

SELECT 
ROUND(
COUNT(CASE WHEN Churn_Flag = 'No' THEN 1 END) * 100.0
/
COUNT(*),
2
) AS Retention_Rate
FROM saas_usage;

SELECT 
ROUND(
COUNT(CASE WHEN Upgrade_Flag = 'Yes' THEN 1 END) * 100.0
/
COUNT(*),
2
) AS Upgrade_Rate
FROM saas_usage;

SELECT 
Subscription_Plan,
SUM(Monthly_Revenue) AS Revenue
FROM saas_usage
GROUP BY Subscription_Plan
ORDER BY Revenue DESC;

SELECT 
Feature_Used,
COUNT(*) AS Usage_Count
FROM saas_usage
GROUP BY Feature_Used
ORDER BY Usage_Count DESC;

SELECT 
Device_Type,
COUNT(*) AS Total_Users
FROM saas_usage
GROUP BY Device_Type;

SELECT 
Country,
SUM(Monthly_Revenue) AS Revenue
FROM saas_usage
GROUP BY Country
ORDER BY Revenue DESC;

SELECT 
Subscription_Plan,
SUM(Support_Tickets) AS Total_Tickets
FROM saas_usage
GROUP BY Subscription_Plan;