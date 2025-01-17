
-- Createing a table containing the list of countries as of 2022

CREATE TABLE countries (
    continent VARCHAR(255),
    country VARCHAR(255)
);

select * from countries

-- Creating a table to store the data

CREATE TABLE country_data (
    country VARCHAR(255),
    year INTEGER,
    iso_code VARCHAR(10),
    population BIGINT,
    gdp NUMERIC,
    cement_co2 NUMERIC,
    cement_co2_per_capita NUMERIC,
    co2 NUMERIC,
    co2_growth_abs NUMERIC,
    co2_growth_prct NUMERIC,
    co2_including_luc NUMERIC,
    co2_including_luc_growth_abs NUMERIC,
    co2_including_luc_growth_prct NUMERIC,
    co2_including_luc_per_capita NUMERIC,
    co2_including_luc_per_gdp NUMERIC,
    co2_including_luc_per_unit_energy NUMERIC,
    co2_per_capita NUMERIC,
    co2_per_gdp NUMERIC,
    co2_per_unit_energy NUMERIC,
    coal_co2 NUMERIC,
    coal_co2_per_capita NUMERIC,
    consumption_co2 NUMERIC,
    consumption_co2_per_capita NUMERIC,
    consumption_co2_per_gdp NUMERIC,
    cumulative_cement_co2 NUMERIC,
    cumulative_co2 NUMERIC,
    cumulative_co2_including_luc NUMERIC,
    cumulative_coal_co2 NUMERIC,
    cumulative_flaring_co2 NUMERIC,
    cumulative_gas_co2 NUMERIC,
    cumulative_luc_co2 NUMERIC,
    cumulative_oil_co2 NUMERIC,
    cumulative_other_co2 NUMERIC,
    energy_per_capita NUMERIC,
    energy_per_gdp NUMERIC,
    flaring_co2 NUMERIC,
    flaring_co2_per_capita NUMERIC,
    gas_co2 NUMERIC,
    gas_co2_per_capita NUMERIC,
    ghg_excluding_lucf_per_capita NUMERIC,
    ghg_per_capita NUMERIC,
    land_use_change_co2 NUMERIC,
    land_use_change_co2_per_capita NUMERIC,
    methane NUMERIC,
    methane_per_capita NUMERIC,
    nitrous_oxide NUMERIC,
    nitrous_oxide_per_capita NUMERIC,
    oil_co2 NUMERIC,
    oil_co2_per_capita NUMERIC,
    other_co2_per_capita NUMERIC,
    other_industry_co2 NUMERIC,
    primary_energy_consumption NUMERIC,
    share_global_cement_co2 NUMERIC,
    share_global_co2 NUMERIC,
    share_global_co2_including_luc NUMERIC,
    share_global_coal_co2 NUMERIC,
    share_global_cumulative_cement_co2 NUMERIC,
    share_global_cumulative_co2 NUMERIC,
    share_global_cumulative_co2_including_luc NUMERIC,
    share_global_cumulative_coal_co2 NUMERIC,
    share_global_cumulative_flaring_co2 NUMERIC,
    share_global_cumulative_gas_co2 NUMERIC,
    share_global_cumulative_luc_co2 NUMERIC,
    share_global_cumulative_oil_co2 NUMERIC,
    share_global_cumulative_other_co2 NUMERIC,
    share_global_flaring_co2 NUMERIC,
    share_global_gas_co2 NUMERIC,
    share_global_luc_co2 NUMERIC,
    share_global_oil_co2 NUMERIC,
    share_global_other_co2 NUMERIC,
    share_of_temperature_change_from_ghg NUMERIC,
    temperature_change_from_ch4 NUMERIC,
    temperature_change_from_co2 NUMERIC,
    temperature_change_from_ghg NUMERIC,
    temperature_change_from_n2o NUMERIC,
    total_ghg NUMERIC,
    total_ghg_excluding_lucf NUMERIC,
    trade_co2 NUMERIC,
    trade_co2_share NUMERIC
);

select * from country_data

-- Creating & Updating the final table to use for analysis

CREATE TABLE emissions_data AS
SELECT
	continent,
    c.country,
    year,
    population,
    gdp,
    cement_co2,
    coal_co2,
    flaring_co2,
    gas_co2,
    oil_co2,
    other_industry_co2,
    co2,
    land_use_change_co2,
    co2_including_luc,
    co2_growth_abs,
    co2_growth_prct,
    co2_including_luc_growth_abs,
    co2_including_luc_growth_prct,
    consumption_co2,
    methane,
    nitrous_oxide,
    temperature_change_from_ch4,
    temperature_change_from_co2,
    temperature_change_from_ghg,
    temperature_change_from_n2o
FROM countries c
INNER JOIN country_data cd ON c.country = cd.country;

UPDATE emissions_data
SET population = COALESCE(population, 0.000),
    gdp = COALESCE(gdp, 0.000),
    cement_co2 = COALESCE(cement_co2, 0.000),
    coal_co2 = COALESCE(coal_co2, 0.000),
    flaring_co2 = COALESCE(flaring_co2, 0.000),
    gas_co2 = COALESCE(gas_co2, 0.000),
    oil_co2 = COALESCE(oil_co2, 0.000),
    other_industry_co2 = COALESCE(other_industry_co2, 0.000),
    co2 = COALESCE(co2, 0.000),
    land_use_change_co2 = COALESCE(land_use_change_co2, 0.000),
    co2_including_luc = COALESCE(co2_including_luc, 0.000),
    co2_growth_abs = COALESCE(co2_growth_abs, 0.000),
    co2_growth_prct = COALESCE(co2_growth_prct, 0.000),
    co2_including_luc_growth_abs = COALESCE(co2_including_luc_growth_abs, 0.000),
    co2_including_luc_growth_prct = COALESCE(co2_including_luc_growth_prct, 0.000),
    consumption_co2 = COALESCE(consumption_co2, 0.000),
    methane = COALESCE(methane, 0.000),
    nitrous_oxide = COALESCE(nitrous_oxide, 0.000),
    temperature_change_from_ch4 = COALESCE(temperature_change_from_ch4, 0.000),
    temperature_change_from_co2 = COALESCE(temperature_change_from_co2, 0.000),
    temperature_change_from_ghg = COALESCE(temperature_change_from_ghg, 0.000),
    temperature_change_from_n2o = COALESCE(temperature_change_from_n2o, 0.000);
	
select * from emissions_data