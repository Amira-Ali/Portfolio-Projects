/****** Cleansed Internet Sales Table  ******/
SELECT [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]     
      ,[SalesOrderNumber]     
      ,[SalesAmount]     
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] 
  where year(OrderDate) >= (YEAR(GETDATE()) - 2)
  order by [OrderDateKey]
