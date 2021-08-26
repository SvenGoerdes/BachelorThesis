

-- create table mobility for counties

create table CountyMobility as
Select * from
(Select * from Mobility2020 Union Select* from Mobility2021) where census_fips_code IS NOT NULL

Select Distinct(county) from CovidCounties where fips IS NULL and county != 'Unknown';
Select * from CountyMobility where sub_region_1 ='New York City'

Select Distinct(county) from CovidCounties where state = 'New York'
Select Distinct(sub_region_2) from CountyMobility where sub_region_1 = 'New York'





Create TABLE CountyCovidMobility as 
Select c.*,
m.retail_and_recreation_percent_change_from_baseline as RetailandRecreation,
m.grocery_and_pharmacy_percent_change_from_baseline as GroceryPharmacy,
m.parks_percent_change_from_baseline as Parks,
m.transit_stations_percent_change_from_baseline as Transit,
m.workplaces_percent_change_from_baseline as Work,
m.residential_percent_change_from_baseline as Resident

 from CovidCounties as c
	inner join CountyMobility as m 
	on c.fips = m.census_fips_code
	and c.date = m.date 

Create TABLE CountyPop2 as 
Select STATE,COUNTY,STNAME,CTYNAME,POPESTIMATE2019 from CountyPopulation  where STNAME <> CTYNAME 


Select CTYNAME,COUNT(CTYNAME) from CountyPop2 group by CTYNAME
Select RIGHT('000'+CAST(COUNTY AS VARCHAR(3)),3) from CountyPopulation