
-- create new TABLE
Create TABLE US21 as
Select * from Weather2021 where substr(field1,1,2) = 'US'


-- merge weather data
Create TABLE Weather as
Select * from US20 
UNION ALL
SELECT * from US21

-- merge Weather with  State 
--Select w.*,u.ST from Weather as w 
	--inner join USstation as u 
	--on w.ID = u.ID



-- create Weather elements Tables 
	-- PRCP
Create Table Precipitation as
Select w.*,u.ST from Weather as w
 inner join USstation as u 
	on w.ID = u.ID
 where w.ELEMENT = 'PRCP'

	-- TEMP
Create Table Temperature as
Select w.*,u.ST from Weather as w
 inner join USstation as u 
	on w.ID = u.ID
where ELEMENT = 'TMAX'

	-- SNOW
Create Table Snow as
Select w.*,u.ST from Weather as w
 inner join USstation as u 
	on w.ID = u.ID
 where ELEMENT = 'SNOW'



-- merge Mobility

Create TABLe Mobility as 
Select * from Mobility2020 where iso_3166_2_code != ''
UNION ALL
Select * from Mobility2021 where iso_3166_2_code != ''
-- Check for corectness
Select * from Mobility order by sub_region_1,date



-- Covid
Select * from Covid order by state,date




-- Merge everything


Create TABLE CovidMobility as 
Select c.*,
m.retail_and_recreation_percent_change_from_baseline as RetailandRecreation,
m.grocery_and_pharmacy_percent_change_from_baseline as GroceryPharmacy,
m.parks_percent_change_from_baseline as Parks,
m.transit_stations_percent_change_from_baseline as Transit,
m.workplaces_percent_change_from_baseline as Work,
m.residential_percent_change_from_baseline as Resident

 from Covid as c
	inner join Mobility as m 
	on c.state = m.sub_region_1
	and c.date = m.date 
	order by state,date
	
	inner join TEMP
	
	
	
	
	
	
	

	