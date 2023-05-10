
This project is offered by this amazing Youtube channel (https://www.youtube.com/@aliahmad./featured)
or you can find him on (https://github.com/aliahmad-1987)

**Target**<br /> To provide insights for a company owner about his business.

**Client Requirements**
* Internet sales by products
* Internet sales by customer
* Internet sales by sales employee
* How Internet sales has been over time
 <br />

**Sales Overview**<br />
![alt text](https://github.com/Amira-Ali/Portfolio-Projects/blob/main/Sales%20Insights/sales%20overview.png)

**Sales by Customers**<br/>
![alt text](https://github.com/Amira-Ali/Portfolio-Projects/blob/main/Sales%20Insights/sales%20by%20customers.png)

**Sales by Products**<br/>
![alt text](https://github.com/Amira-Ali/Portfolio-Projects/blob/main/Sales%20Insights/sales%20by%20products.png)

**Link to live Dashboard**<br/>
https://app.powerbi.com/links/Yugs1wefWC?ctid=84008d0f-90f6-4e21-b588-403ad5bfdd2f&pbi_source=linkShare

**Tools Used**<br />
Microsoft Excel + Microsoft Sql Server + Power BI

**Final Thoughts**<br/>
* Main Data source is AdventureWorksDW2019 provided by Microsoft. Link to download https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
* One of client requirements was not answered because it concerned sales employees and those employees work in physical stores not the online ones, and since the client was interested only in internet sales, this requirement became invalid.
* The client provided an excel sheet with a two-year budget data (not included originally in AdventureWorksDW2019 db)
* All utilized data in this project were exported to csv files and imported later in power bi except for the product table, I had to import it directly from SQL server to power bi because I needed to use the binary column that contains product image and exporting it to csv file broke the resulted file.
* After importing product table to power bi, I had to perform small steps on the binary column to be able to display it in my dashboard. Link for steps: https://www.c-sharpcorner.com/blogs/load-image-file-in-power-bi-from-sql-server
* The client is obviously an imaginary person, and I had so much fun learning and picking up data analysis skills throughout this project:smiling_face_with_three_hearts:
