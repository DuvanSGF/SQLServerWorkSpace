--Working with XML
Select * from Power
for xml raw, xmlschema
Go
Declare @X2 xml
set @x2 = '<shopping ShopperName="Alejandra Quevedo">
<shoppingTrip ShoppingTripID="L1">
	<Item>="Apple""</Item>
	</shoppingTrip>
	</shopping>'
	Select @X2
GO

--JSON
Declare @json nvarchar(MAX)
set @json = '
{
"name":"Angi Pahola",
"Shopping":
	{"ShoppingTrip":1,
	 "Items":
	 [
		{"Item":"Apple","Cost":5},
		{"Item":"Banana","Cost":9},
		{"Item":"Cherries","Cost":2}
	]
	}
}'

Select * from openjson(@json,'$.Shopping.Items')
		With(Item varchar(10), Cost int)
