# ENVIO DE ESTADOS FALABELLA

## ENVIO MANUAL

Si se desea realizar un envio manual, seguir los pasos:

1. Dirigirse al archivo `data.js`
2. Llenar el arreglo con objetos que tenga como atributos

   ```js
   { trackCode: "TRACKCODE0", statusID: 166 }
   ```

3. El archivo `data.js`, debe verse similar al ejemplo:

   ```js
   module.exports = [
    { trackCode: "TRACKCODE1", statusID: 166 },
    { trackCode: "TRACKCODE2", statusID: 162 },
    { trackCode: "TRACKCODE3", statusID: 166 },
    { trackCode: "TRACKCODE4", statusID: 162 },
   ];
   ```

   Para conseguir estos objetos, puede dirigirse a la tabla **Orders**

   ```sql
   select  o."trackCode", o."statusID"  from "Orders" o where o."enterpriseID" = 4396
   and o."statusID" in (SELECT ebbsh."statusID"  from "EnterprisesBodyByStateHooks" ebbsh where ebbsh."enterpriseID" = 4396)
   and o."trackCode" in ('TRACKCODE1', 'TRACKCODE2', 'TRACKCODE3', 'TRACKCODE4')
   ```

   Y posterior, exportar esto como **JSON**
