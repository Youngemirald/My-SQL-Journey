use marketdb;

-- Top 5 Best-Sellers
SELECT p.Name, SUM(s.Quantity) AS TotalQuantitySold
FROM Sales s
JOIN Produce p ON s.ProduceID = p.ProduceID
GROUP BY p.Name
ORDER BY TotalQuantitySold DESC
LIMIT 5;

-- Top 5 Biggest Spenders
SELECT b.BuyerName, SUM(s.Quantity * p.UnitPrice) AS TotalSpent
FROM Sales s
JOIN Buyers b ON s.BuyerID = b.BuyerID
JOIN Produce p ON s.ProduceID = p.ProduceID
GROUP BY b.BuyerName
ORDER BY TotalSpent DESC
LIMIT 5;

-- Monthly Sales Trend
SELECT 
DATE_FORMAT(SaleDate, '%Y-%m') AS Month,
SUM(s.Quantity * p.UnitPrice) AS MonthlyRevenue
FROM Sales s
JOIN Produce p ON s.ProduceID = p.ProduceID
GROUP BY DATE_FORMAT(SaleDate, '%Y-%m')
ORDER BY Month;

-- List produce items with less than 10 left in stock
SELECT Name, Stock
FROM Produce
WHERE Stock < 10
ORDER BY Stock ASC;

-- List buyers who bought 3 or more times
SELECT b.BuyerName, COUNT(*) AS PurchaseCount
FROM Sales s
JOIN Buyers b ON s.BuyerID = b.BuyerID
GROUP BY b.BuyerName
HAVING COUNT(*) >= 3
ORDER BY PurchaseCount DESC;

