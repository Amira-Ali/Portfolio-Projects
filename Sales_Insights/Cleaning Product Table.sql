/****** Cleansed Product Table  ******/

use AdventureWorksDW2019;

SELECT P.ProductKey as Productkey
      ,P.ProductAlternateKey as ItemCode
      ,P.EnglishProductName as ProductName
	  ,PC.EnglishProductCategoryName as ProductCategory
	  ,PSC.EnglishProductSubcategoryName as ProdcutSubCat
      ,P.Color as ProductColor
	   ,P.Size as ProductSize
	   ,P.ProductLine as ProductLine
	   ,P.ModelName as ProductModel
    ,P.LargePhoto as ProductPhoto
      ,P.EnglishDescription as ProductDesc
      ,Isnull(P.[Status], 'Outdated') as ProductStatus
  FROM [AdventureWorksDW2019].[dbo].[DimProduct]  P
  left join DimProductSubcategory  PSC
  on p.ProductSubcategoryKey= PSC.ProductSubcategoryKey
  left join DimProductCategory PC 
  on pc.ProductCategoryKey=PSC.ProductCategoryKey
  order by p.ProductKey