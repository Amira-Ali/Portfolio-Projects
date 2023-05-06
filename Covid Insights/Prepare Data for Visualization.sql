---Create Temp Table for Global Infection Rate (just for fun ^_^)
Drop Table if exists #InfectionRate

Create Table #InfectionRate
(
location nvarchar(255),
population bigint, 
total_cases bigint,
infection_perc float
)

with my_temp_result_set(location, population, total_cases, rolling_cases_number) as 
(
select location, population, total_cases, sum(cast(new_cases as int)) over (order by date) as rolling_cases_number  
from Deaths where continent!='' 
)
insert into #InfectionRate select location, max(population) as population, max(total_cases) as total_cases, max( round( (total_cases / population * 100),2) ) as infection_perc 
from my_temp_result_set 
group by location 
order by infection_perc

select * from #InfectionRate order by infection_perc desc

--Now Create the actual View that we'll be working on later when visulaizing my data
--#Note: view likes to be the only statement in the batch, so copy and paste next script in new window
create view InfectionRate AS
with my_temp_result_set(location, population, total_cases, rolling_cases_number) as 
(
select location, population, total_cases, sum(cast(new_cases as int)) over (order by date) as rolling_cases_number  
from Deaths where continent!='' 
)
select location, max(population) as population, max(total_cases) as total_cases, max( round( (total_cases / population * 100),2) ) as infection_perc 
from my_temp_result_set 
group by location 
