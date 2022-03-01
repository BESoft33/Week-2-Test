with value_stocks as (
	select case when 
 		d.fiscal_year-lag(d.fiscal_year) over(partition by d.company) = 10001 and
 		lead(d.fiscal_year) over(partition by d.company)-d.fiscal_year = 10001
		then d.company 
	end valuable
	
from dividend d
)
select distinct valuable from value_stocks where valuable is not null;