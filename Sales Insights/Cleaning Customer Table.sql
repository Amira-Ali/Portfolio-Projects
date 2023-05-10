/****** Cleansed Customer Table  ******/
SELECT [CustomerKey] as Customer_key     
      ,[FirstName] as First_name
      ,[LastName] as Last_name
	  , c.FirstName + ' ' + c.LastName as Full_name
	  , case c.Gender when 'M' then 'Male' when 'F' then 'Famale' end as Gender
      ,[DateFirstPurchase] as Date_first_purchase
	  , d.City as City
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer] as c inner join DimGeography as d
  on c.GeographyKey = d.GeographyKey
  order by date_first_purchase