select  "orderInfoData" ->'trackCode'->>'value' , * from "OriginalOrders" oo where 
"cityID" = 5  and "orderInfoData" ->'trackCode'->>'value' in () 
order by "orderInfoData" ->'trackCode'->>'value' desc, "createdAt" desc


select deleted , *  from "Orders" o where "trackCode" in ('MIA2500938479') and "cityID" = 5


select * from "Orders" o where substring("trackCode", 9 , length("trackCode"))  in ()


select * from "OriginalOrders" oo where "cityID" = 5 and "blocked" = true and deleted = false

-------------------------

select * from "Routes" r where "cityID" = 5 and deleted = false and "createdAt" < '2022-10-10'

select "createdAt" , "updatedAt" , "trackCode" , deleted , "statusID" , * from "Orders" o where 
"cityID" = 5 and "createdAt" < '2022-10-10' and (deleted = true or "trackCode"ilike 'DELETED-%')





select * from "Users" u where "cityID" = 5 and names ilike '%walter%'

