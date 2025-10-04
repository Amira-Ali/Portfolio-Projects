/****** Cleansed [DimDate] Table ******/
SELECT  [DateKey]
      ,[FullDateAlternateKey] as Date
      ,left([EnglishDayNameOfWeek],3) as Day
      ,[WeekNumberOfYear] as Week      
	   ,left([EnglishMonthName],3) as Month
      ,[MonthNumberOfYear] as Month_no
      ,[CalendarQuarter] as Quarter
      ,[CalendarYear] as Year
  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  where CalendarYear > = 2021