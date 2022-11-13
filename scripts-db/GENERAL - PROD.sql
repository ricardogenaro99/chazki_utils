SELECT * FROM "Orders" o where "trackCode" in ('149080684243',
'149081050236',
'149081068411',
'149081118084')

select o."trackCode" , os.id , osh."statusID", gt.subclass , osh."createdAt" , osh."updatedAt"  from "OrderServiceHistorial" osh 
left join "OrderService" os on osh."orderServiceID" = os.id 
left join "Orders" o on os."orderID" = o.id 
left join "GeneralTypes" gt on osh."statusID" = gt.subtype 
where o."trackCode"  in ('149080684243',
'149081050236',
'149081068411',
'149081118084') and os.deleted = false and osh.deleted = false
order by o."trackCode" , os.id , osh.id 


select o."trackCode" , gt.subclass , e."comercialName", o.*  from "Orders" o 
left join "Enterprises" e on o."enterpriseID" = e.id 
left join "GeneralTypes" gt on o."statusID" = gt.subtype 
where  o."trackCode" in ('41775946731') 
order by "trackCode" 


select subtype , subclass as "ESTADO NINTENDO"  , extra->'enterpriseHook'->'4396'->>'statusCode' as "ESTADO FALABELLA" , extra  from "GeneralTypes" gt where gt."class" = 'Estado de la Orden' and deleted = false


select i.id, i.name, gt.subclass as "ESTADO VINCULADO", i.extra->'enterpriseHook'->'4396'->>'statusCode' as "MOTIVO DE FALLO FALABELLA" from "Incidence" i
left join "GeneralTypes" gt on gt.subtype = i."statusIDVinculated" 
where "countryID" = 3
order by "MOTIVO DE FALLO FALABELLA"


select * from "Users" u where email = 'ricardo.serrudo@chazki.com'


select * from "Orders" o where "trackCode" = 'PF545284'





select o."trackCode" , os.id as "ORDER-SERVICE" , r."routeCode", o."statusID" as "ESTADO-ORDEN", os."lastStatusID" as "ESTADO-SERVICE", osh."statusID" as  "ESTADO-HISTORIAL", osh.* , o.*, os.*from "OrderServiceHistorial" osh 
left join "OrderService" os on osh."orderServiceID" = os.id 
inner join "Routes" r on os."routeID" = r.id and r."routeCode" in ('fe1f61c7',
'3f8d823e'
)
inner join "Orders" o on os."orderID" = o.id and o."trackCode" in ('7398590',
'7398436',
'A0010492',
'MKT_21_MIGUEL071122',
'7398587',
'7398477',
'A0010346',
'7398511',
'7398457',
'7398411',
'SKDY_21_109606',
'A0010039',
'#19955',
'7398390',
'7398440',
'7398476',
'D5764607598893205588',
'ST5764607634150524836',
'D5764607697723590463',
'D5764607743579916076',
'PF547689',
'7398530',
'7398550',
'7398404',
'7398537',
'7398586',
'7398553',
'7398559',
'7398423',
'7398422',
'7398463',
'7398391',
'0d77ff3b-b53d-4bd3-aa65-9b57459d766f',
'366806',
'A0010291',
'GRNT_21_79947',
'CASIO9654',
'7398488',
'7398402',
'7398517',
'7398490',
'7398467',
'355d0200-82d9-479e-873a-d9fc6962b153',
'7398513',
'7398494',
'7398585',
'#19949',
'D5764607707810891866',
'D5764607637371750208',
'A0010398',
'D5764607776194823985',
'7398606',
'A0010344',
'7398540',
'7398444',
'7398591',
'7398416')
order by o."trackCode" , os.id, osh.id 


















