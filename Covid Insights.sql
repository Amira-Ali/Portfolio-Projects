--World Wide Population
with temp_tbl(location,population) as 
(
select distinct(location), population 
from Deaths where continent!='' 
)
select sum(population) as World_Wide_Population from temp_tbl 

--Population for each country
with temp_tbl(location,population) as 
(
select distinct(location), population 
from Deaths where continent!='' 
)
select location, max(population) as population from temp_tbl group by location order by population

--World Wide Rolling Cases Number
select location, date, new_cases, total_cases, sum(cast(new_cases as int)) over (partition by location order by date) as rolling_cases_number  
from Deaths where continent!='' order by location, date


--World Wide Total Cases
with my_temp_result_set(location,population, new_cases, total_cases,rolling_cases_number) as 
(
select location,population, new_cases, total_cases, sum(cast(new_cases as int)) over (order by date) as rolling_cases_number  
from Deaths where continent!='' 
)
select max(rolling_cases_number) as covid_world_wide_total from my_temp_result_set


--World Wide Total Cases, population and the infection %
with my_temp_result_set(location,population, new_cases, total_cases,rolling_cases_number) as 
(
select location, population, new_cases, total_cases, sum(cast(new_cases as int)) over (order by date) as rolling_cases_number  
from Deaths where continent!='' 
)

select location, max(population) as population, max(total_cases) as cases, max( round( (total_cases / population * 100),2) ) as infection_perc 
from my_temp_result_set 
group by location 
order by infection_perc


--Country with most infection Rate 
SELECT
[location],    
    max( [population]) as population,
	 max( [total_cases]) as total_cases ,  
	max( round( (([total_cases]/[population])*100) ,2)  )   as Infection_Rate 
  FROM [LearnDA].[dbo].[Deaths]
  group by location
 order by Infection_Rate desc

 --Heighest death count By Continent
 SELECT
continent, max( [total_deaths]) as total_deaths   
  FROM [LearnDA].[dbo].[Deaths]
  where continent !=''
  group by  continent
 order by total_deaths desc

--Heighest death count By Country
SELECT
[location], max( [total_deaths]) as total_deaths   
  FROM [LearnDA].[dbo].[Deaths]
  where continent !='' 
  group by  location
 order by total_deaths desc

 --Daily Cumulative World Death %
 SELECT [date],     
    sum( [total_cases]) as cumulative_cases,  
    sum(total_deaths) as cumulative_deaths,
	case when sum( [total_cases])=0 
	then 0
	else 
	round(sum(cast(total_deaths as float))/sum(cast(total_cases as float))*100	,2) end as Deaths_Percentage
  FROM [LearnDA].[dbo].[Deaths]
  where continent !='' 
  group by date
  order by date asc

 
 ------------------LIBYA INSIGHTS----------------
 --How many people got the vaccination
select max(cast(people_vaccinated as int)) as people_vaccinated from Vaccines where iso_code='lby'

--Number of Doses Given
select max(cast(total_vaccinations as int)) as total_vaccinations from Vaccines where iso_code='lby'

--Total Population Vs Vaccinated People in LIBYA
select max(Deaths.population) as population, 
max(cast(people_vaccinated as int)) as people_vaccinated,
max(round( ( people_vaccinated/population *100 ),2)) as vaccination_percentage
from Deaths
inner join Vaccines
on Deaths.iso_code = Vaccines.iso_code
where Deaths.iso_code='lby'


