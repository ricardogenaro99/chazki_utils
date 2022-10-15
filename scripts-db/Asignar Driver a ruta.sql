-- New script in nintendo-PROD.
-- Date: 20 sept. 2022
-- Time: 12:03:11

 

select * from "Users" u where names ilike '%MIGUEL%' and lastname ilike '%CORDOVA%'

select * from "OrderToReturnWarehouse" otrw --where "userID" = 'c9b05e95-893d-47c6-afe8-e588f82b47bf' --and deleted = false

select "currentRouteID" , * from "Affiliates" a where "userID" = ''