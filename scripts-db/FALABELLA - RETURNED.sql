select email , * from "Users" u where "enterpriseID" = 4396 and "principalEnterpriseUser"  = true;
-- nalejbahamondes@falabella.cl



select "contactPeople" , * from "Enterprises" e where id = 4396;
/*{
	"area": "Gerencia Logistica",
	"name": "Fernando Marambio",
	"email": [
	  "femarambioa@falabella.cl"
	],
	"phone": [
	  "+56993835504"
	],
	"currentContact": true
}*/



select o."trackCode" , gt.subclass , o."statusID", deleted  from "Orders" o  
left join "GeneralTypes" gt on o."statusID" = gt.subtype 
where "trackCode" in ();



select id, "warehouseID" , "orderID" , "cityID" , "trackCode" , * from "Stock" s where "trackCode" in ();














select * from "Orders" o where "trackCode" in ('1000725678200' ,
'41776016930',
'41776394826',
'41776287789',
'41776332151',
'41776326824',
'41776104712',
'41775839243'
)