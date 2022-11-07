use cwiczenia4_prod

--Zad3
create clustered index INDX_clustered on DIMCustomers(state)
GO

--Zad4
create view carrier_sales with schemabinding as
select 
c.carrier_name,
fs.order_id,
fs.idkey_pizzas
from [dbo].[Fact_Sales] fs
join [dbo].[DIMCarrier] c on c.carrier_id = fs.idkey_carrier
GO

create unique clustered index indx_carrier_sales_view on carrier_sales (
carrier_name,
order_id,
idkey_pizzas
)

--Zad5
create table DIMState (
	state_id int NOT NULL identity,
	state varchar(255),
	primary key (state_id)
)

insert into DIMState(state)
select distinct(state) from [dbo].DIMCustomers