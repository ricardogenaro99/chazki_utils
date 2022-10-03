delete from "OrderServiceHistorial" osh where osh."orderServiceID" in (
	select os.id from "OrderService" os where os."orderID" in (select o.id FROM "Orders" o where o."trackCode" in ('D5764607771182630632',
'D5764607737577867101',
'D5764607780309436352',
'D5764607776396150820',
'D5764607575858087690',
'D5764607677968418911',
'D5764607571919636186',
'D5764607582908712666',
'D5764607557906466570',
'D5764607760604595951',
'D5764607559491913535',
'D5764607524687578833',
'D5764607524670801850',
'D5764607648608290512',
'D5764607662663403235',
'D5764607720314111726',
'D5764607572972406490',
'D5764607682221442811',
'D5764607758385809171',
'D5764607757802800855',
'D5764607788727404258',
'D5764607673941886691',
'D5764607578009765621',
'D5764607690169649177',
'D5764607759707014871',
'D5764607789142640329',
'D5764607605415348250',
'D5764607743374395414',
'D5764607624964998886',
'D5764607772961015504',
'D5764607613715875854',
'D5764607654643894203',
'D5764607541045364444',
'D5764607705734711005',
'D5764607561115109444',
'D5764607697966859997',
'D5764607543566141516',
'D5764607666954176204',
'D5764607771941799656',
'D5764607761124689683',
'D5764607555729622753',
'D5764607673086249008',
'D5764607562432120639',
'D5764607696154920706',
'D5764607652643211172',
'D5764607591666419631',
'D5764607757895075603',
'D5764607791826995305',
'D5764607763150538455',
'D5764607539938068184',
'D5764607773321725641',
'D5764607670729049827',
'D5764607762332649200',
'D5764607718103713611',
'D5764607673035917021',
'D5764607744406193891',
'D5764607701112587997',
'D5764607666748655662',
'D5764607561190606556',
'D5764607558812436215',
'D5764607669881800396',
'D5764607529045460847',
'D5764607670078932701',
'D5764607569256253529',
'D5764607638139307835',
'D5764607754308945703',
'D5764607753516222188',
'D5764607753738520359',
'D5764607700080789213',
'D5764607792879765195',
'D5764607650973878386',
'D5764607686990366493',
'D5764607652639016656',
'D5764607523190212719',
'D5764607646771185390',
'D5764607654631311297',
'D5764607737431066661',
'D5764607786017883863',
'D5764607581646227268',
'D5764607770905806537',
'D5764607544321115891',
'D5764607540416218840',
'D5764607533202015960',
'D5764607619348826298',
'D5764607754560603875',
'D5764607544220452595',
'D5764607709849323767',
'D5764607644862777070',
'D5764607627095705318',
'D5764607717042554699',
'D5764607672335468236',
'D5764607697681647678',
'D5764607577573557978',
'D5764607666442471139',
'D5764607652102145744',
'D5764607741784754076',
'D5764607683941107567',
'D5764607530001762325',
'D5764607668212467421',
'D5764607559374472929',
'D5764607642878871487',
'D5764607781580310224',
'D5764607696419161858',
'D5764607539552192567',
'D5764607651577857826',
'D5764607643663206335',
'D5764607669009385223',
'D5764607635035523170',
'D5764607700194035728',
'D5764607678241048268',
'D5764607707605370943',
'D5764607641347950652',
'D5764607662378190563',
'D5764607541800339160',
'D5764607709576693784',
'D5764607672545183792',
'D5764607696867952470',
'D5764607545461966544',
'D5764607718451840843',
'D5764607567335261916')
))


delete from "OrdersImages" where "orderID" in (select o.id FROM "Orders" o where o."trackCode"in ('D5764607771182630632',
'D5764607737577867101',
'D5764607780309436352',
'D5764607776396150820',
'D5764607575858087690',
'D5764607677968418911',
'D5764607571919636186',
'D5764607582908712666',
'D5764607557906466570',
'D5764607760604595951',
'D5764607559491913535',
'D5764607524687578833',
'D5764607524670801850',
'D5764607648608290512',
'D5764607662663403235',
'D5764607720314111726',
'D5764607572972406490',
'D5764607682221442811',
'D5764607758385809171',
'D5764607757802800855',
'D5764607788727404258',
'D5764607673941886691',
'D5764607578009765621',
'D5764607690169649177',
'D5764607759707014871',
'D5764607789142640329',
'D5764607605415348250',
'D5764607743374395414',
'D5764607624964998886',
'D5764607772961015504',
'D5764607613715875854',
'D5764607654643894203',
'D5764607541045364444',
'D5764607705734711005',
'D5764607561115109444',
'D5764607697966859997',
'D5764607543566141516',
'D5764607666954176204',
'D5764607771941799656',
'D5764607761124689683',
'D5764607555729622753',
'D5764607673086249008',
'D5764607562432120639',
'D5764607696154920706',
'D5764607652643211172',
'D5764607591666419631',
'D5764607757895075603',
'D5764607791826995305',
'D5764607763150538455',
'D5764607539938068184',
'D5764607773321725641',
'D5764607670729049827',
'D5764607762332649200',
'D5764607718103713611',
'D5764607673035917021',
'D5764607744406193891',
'D5764607701112587997',
'D5764607666748655662',
'D5764607561190606556',
'D5764607558812436215',
'D5764607669881800396',
'D5764607529045460847',
'D5764607670078932701',
'D5764607569256253529',
'D5764607638139307835',
'D5764607754308945703',
'D5764607753516222188',
'D5764607753738520359',
'D5764607700080789213',
'D5764607792879765195',
'D5764607650973878386',
'D5764607686990366493',
'D5764607652639016656',
'D5764607523190212719',
'D5764607646771185390',
'D5764607654631311297',
'D5764607737431066661',
'D5764607786017883863',
'D5764607581646227268',
'D5764607770905806537',
'D5764607544321115891',
'D5764607540416218840',
'D5764607533202015960',
'D5764607619348826298',
'D5764607754560603875',
'D5764607544220452595',
'D5764607709849323767',
'D5764607644862777070',
'D5764607627095705318',
'D5764607717042554699',
'D5764607672335468236',
'D5764607697681647678',
'D5764607577573557978',
'D5764607666442471139',
'D5764607652102145744',
'D5764607741784754076',
'D5764607683941107567',
'D5764607530001762325',
'D5764607668212467421',
'D5764607559374472929',
'D5764607642878871487',
'D5764607781580310224',
'D5764607696419161858',
'D5764607539552192567',
'D5764607651577857826',
'D5764607643663206335',
'D5764607669009385223',
'D5764607635035523170',
'D5764607700194035728',
'D5764607678241048268',
'D5764607707605370943',
'D5764607641347950652',
'D5764607662378190563',
'D5764607541800339160',
'D5764607709576693784',
'D5764607672545183792',
'D5764607696867952470',
'D5764607545461966544',
'D5764607718451840843',
'D5764607567335261916')	)


delete from "OrderServiceCommentary" osc   where osc."orderID" in (select o.id FROM "Orders" o where o."trackCode" in ('D5764607771182630632',
'D5764607737577867101',
'D5764607780309436352',
'D5764607776396150820',
'D5764607575858087690',
'D5764607677968418911',
'D5764607571919636186',
'D5764607582908712666',
'D5764607557906466570',
'D5764607760604595951',
'D5764607559491913535',
'D5764607524687578833',
'D5764607524670801850',
'D5764607648608290512',
'D5764607662663403235',
'D5764607720314111726',
'D5764607572972406490',
'D5764607682221442811',
'D5764607758385809171',
'D5764607757802800855',
'D5764607788727404258',
'D5764607673941886691',
'D5764607578009765621',
'D5764607690169649177',
'D5764607759707014871',
'D5764607789142640329',
'D5764607605415348250',
'D5764607743374395414',
'D5764607624964998886',
'D5764607772961015504',
'D5764607613715875854',
'D5764607654643894203',
'D5764607541045364444',
'D5764607705734711005',
'D5764607561115109444',
'D5764607697966859997',
'D5764607543566141516',
'D5764607666954176204',
'D5764607771941799656',
'D5764607761124689683',
'D5764607555729622753',
'D5764607673086249008',
'D5764607562432120639',
'D5764607696154920706',
'D5764607652643211172',
'D5764607591666419631',
'D5764607757895075603',
'D5764607791826995305',
'D5764607763150538455',
'D5764607539938068184',
'D5764607773321725641',
'D5764607670729049827',
'D5764607762332649200',
'D5764607718103713611',
'D5764607673035917021',
'D5764607744406193891',
'D5764607701112587997',
'D5764607666748655662',
'D5764607561190606556',
'D5764607558812436215',
'D5764607669881800396',
'D5764607529045460847',
'D5764607670078932701',
'D5764607569256253529',
'D5764607638139307835',
'D5764607754308945703',
'D5764607753516222188',
'D5764607753738520359',
'D5764607700080789213',
'D5764607792879765195',
'D5764607650973878386',
'D5764607686990366493',
'D5764607652639016656',
'D5764607523190212719',
'D5764607646771185390',
'D5764607654631311297',
'D5764607737431066661',
'D5764607786017883863',
'D5764607581646227268',
'D5764607770905806537',
'D5764607544321115891',
'D5764607540416218840',
'D5764607533202015960',
'D5764607619348826298',
'D5764607754560603875',
'D5764607544220452595',
'D5764607709849323767',
'D5764607644862777070',
'D5764607627095705318',
'D5764607717042554699',
'D5764607672335468236',
'D5764607697681647678',
'D5764607577573557978',
'D5764607666442471139',
'D5764607652102145744',
'D5764607741784754076',
'D5764607683941107567',
'D5764607530001762325',
'D5764607668212467421',
'D5764607559374472929',
'D5764607642878871487',
'D5764607781580310224',
'D5764607696419161858',
'D5764607539552192567',
'D5764607651577857826',
'D5764607643663206335',
'D5764607669009385223',
'D5764607635035523170',
'D5764607700194035728',
'D5764607678241048268',
'D5764607707605370943',
'D5764607641347950652',
'D5764607662378190563',
'D5764607541800339160',
'D5764607709576693784',
'D5764607672545183792',
'D5764607696867952470',
'D5764607545461966544',
'D5764607718451840843',
'D5764607567335261916')	)


delete from "OrderService" os where os."orderID" in (select o.id FROM "Orders" o where o."trackCode" in ('D5764607771182630632',
'D5764607737577867101',
'D5764607780309436352',
'D5764607776396150820',
'D5764607575858087690',
'D5764607677968418911',
'D5764607571919636186',
'D5764607582908712666',
'D5764607557906466570',
'D5764607760604595951',
'D5764607559491913535',
'D5764607524687578833',
'D5764607524670801850',
'D5764607648608290512',
'D5764607662663403235',
'D5764607720314111726',
'D5764607572972406490',
'D5764607682221442811',
'D5764607758385809171',
'D5764607757802800855',
'D5764607788727404258',
'D5764607673941886691',
'D5764607578009765621',
'D5764607690169649177',
'D5764607759707014871',
'D5764607789142640329',
'D5764607605415348250',
'D5764607743374395414',
'D5764607624964998886',
'D5764607772961015504',
'D5764607613715875854',
'D5764607654643894203',
'D5764607541045364444',
'D5764607705734711005',
'D5764607561115109444',
'D5764607697966859997',
'D5764607543566141516',
'D5764607666954176204',
'D5764607771941799656',
'D5764607761124689683',
'D5764607555729622753',
'D5764607673086249008',
'D5764607562432120639',
'D5764607696154920706',
'D5764607652643211172',
'D5764607591666419631',
'D5764607757895075603',
'D5764607791826995305',
'D5764607763150538455',
'D5764607539938068184',
'D5764607773321725641',
'D5764607670729049827',
'D5764607762332649200',
'D5764607718103713611',
'D5764607673035917021',
'D5764607744406193891',
'D5764607701112587997',
'D5764607666748655662',
'D5764607561190606556',
'D5764607558812436215',
'D5764607669881800396',
'D5764607529045460847',
'D5764607670078932701',
'D5764607569256253529',
'D5764607638139307835',
'D5764607754308945703',
'D5764607753516222188',
'D5764607753738520359',
'D5764607700080789213',
'D5764607792879765195',
'D5764607650973878386',
'D5764607686990366493',
'D5764607652639016656',
'D5764607523190212719',
'D5764607646771185390',
'D5764607654631311297',
'D5764607737431066661',
'D5764607786017883863',
'D5764607581646227268',
'D5764607770905806537',
'D5764607544321115891',
'D5764607540416218840',
'D5764607533202015960',
'D5764607619348826298',
'D5764607754560603875',
'D5764607544220452595',
'D5764607709849323767',
'D5764607644862777070',
'D5764607627095705318',
'D5764607717042554699',
'D5764607672335468236',
'D5764607697681647678',
'D5764607577573557978',
'D5764607666442471139',
'D5764607652102145744',
'D5764607741784754076',
'D5764607683941107567',
'D5764607530001762325',
'D5764607668212467421',
'D5764607559374472929',
'D5764607642878871487',
'D5764607781580310224',
'D5764607696419161858',
'D5764607539552192567',
'D5764607651577857826',
'D5764607643663206335',
'D5764607669009385223',
'D5764607635035523170',
'D5764607700194035728',
'D5764607678241048268',
'D5764607707605370943',
'D5764607641347950652',
'D5764607662378190563',
'D5764607541800339160',
'D5764607709576693784',
'D5764607672545183792',
'D5764607696867952470',
'D5764607545461966544',
'D5764607718451840843',
'D5764607567335261916')	)


delete from "Activities" a where a."orderID" in (select o.id FROM "Orders" o where o."trackCode" in ('D5764607771182630632',
'D5764607737577867101',
'D5764607780309436352',
'D5764607776396150820',
'D5764607575858087690',
'D5764607677968418911',
'D5764607571919636186',
'D5764607582908712666',
'D5764607557906466570',
'D5764607760604595951',
'D5764607559491913535',
'D5764607524687578833',
'D5764607524670801850',
'D5764607648608290512',
'D5764607662663403235',
'D5764607720314111726',
'D5764607572972406490',
'D5764607682221442811',
'D5764607758385809171',
'D5764607757802800855',
'D5764607788727404258',
'D5764607673941886691',
'D5764607578009765621',
'D5764607690169649177',
'D5764607759707014871',
'D5764607789142640329',
'D5764607605415348250',
'D5764607743374395414',
'D5764607624964998886',
'D5764607772961015504',
'D5764607613715875854',
'D5764607654643894203',
'D5764607541045364444',
'D5764607705734711005',
'D5764607561115109444',
'D5764607697966859997',
'D5764607543566141516',
'D5764607666954176204',
'D5764607771941799656',
'D5764607761124689683',
'D5764607555729622753',
'D5764607673086249008',
'D5764607562432120639',
'D5764607696154920706',
'D5764607652643211172',
'D5764607591666419631',
'D5764607757895075603',
'D5764607791826995305',
'D5764607763150538455',
'D5764607539938068184',
'D5764607773321725641',
'D5764607670729049827',
'D5764607762332649200',
'D5764607718103713611',
'D5764607673035917021',
'D5764607744406193891',
'D5764607701112587997',
'D5764607666748655662',
'D5764607561190606556',
'D5764607558812436215',
'D5764607669881800396',
'D5764607529045460847',
'D5764607670078932701',
'D5764607569256253529',
'D5764607638139307835',
'D5764607754308945703',
'D5764607753516222188',
'D5764607753738520359',
'D5764607700080789213',
'D5764607792879765195',
'D5764607650973878386',
'D5764607686990366493',
'D5764607652639016656',
'D5764607523190212719',
'D5764607646771185390',
'D5764607654631311297',
'D5764607737431066661',
'D5764607786017883863',
'D5764607581646227268',
'D5764607770905806537',
'D5764607544321115891',
'D5764607540416218840',
'D5764607533202015960',
'D5764607619348826298',
'D5764607754560603875',
'D5764607544220452595',
'D5764607709849323767',
'D5764607644862777070',
'D5764607627095705318',
'D5764607717042554699',
'D5764607672335468236',
'D5764607697681647678',
'D5764607577573557978',
'D5764607666442471139',
'D5764607652102145744',
'D5764607741784754076',
'D5764607683941107567',
'D5764607530001762325',
'D5764607668212467421',
'D5764607559374472929',
'D5764607642878871487',
'D5764607781580310224',
'D5764607696419161858',
'D5764607539552192567',
'D5764607651577857826',
'D5764607643663206335',
'D5764607669009385223',
'D5764607635035523170',
'D5764607700194035728',
'D5764607678241048268',
'D5764607707605370943',
'D5764607641347950652',
'D5764607662378190563',
'D5764607541800339160',
'D5764607709576693784',
'D5764607672545183792',
'D5764607696867952470',
'D5764607545461966544',
'D5764607718451840843',
'D5764607567335261916')	)


delete from "Stock" where "orderID" in (select o.id FROM "Orders" o where o."trackCode" in ('D5764607771182630632',
'D5764607737577867101',
'D5764607780309436352',
'D5764607776396150820',
'D5764607575858087690',
'D5764607677968418911',
'D5764607571919636186',
'D5764607582908712666',
'D5764607557906466570',
'D5764607760604595951',
'D5764607559491913535',
'D5764607524687578833',
'D5764607524670801850',
'D5764607648608290512',
'D5764607662663403235',
'D5764607720314111726',
'D5764607572972406490',
'D5764607682221442811',
'D5764607758385809171',
'D5764607757802800855',
'D5764607788727404258',
'D5764607673941886691',
'D5764607578009765621',
'D5764607690169649177',
'D5764607759707014871',
'D5764607789142640329',
'D5764607605415348250',
'D5764607743374395414',
'D5764607624964998886',
'D5764607772961015504',
'D5764607613715875854',
'D5764607654643894203',
'D5764607541045364444',
'D5764607705734711005',
'D5764607561115109444',
'D5764607697966859997',
'D5764607543566141516',
'D5764607666954176204',
'D5764607771941799656',
'D5764607761124689683',
'D5764607555729622753',
'D5764607673086249008',
'D5764607562432120639',
'D5764607696154920706',
'D5764607652643211172',
'D5764607591666419631',
'D5764607757895075603',
'D5764607791826995305',
'D5764607763150538455',
'D5764607539938068184',
'D5764607773321725641',
'D5764607670729049827',
'D5764607762332649200',
'D5764607718103713611',
'D5764607673035917021',
'D5764607744406193891',
'D5764607701112587997',
'D5764607666748655662',
'D5764607561190606556',
'D5764607558812436215',
'D5764607669881800396',
'D5764607529045460847',
'D5764607670078932701',
'D5764607569256253529',
'D5764607638139307835',
'D5764607754308945703',
'D5764607753516222188',
'D5764607753738520359',
'D5764607700080789213',
'D5764607792879765195',
'D5764607650973878386',
'D5764607686990366493',
'D5764607652639016656',
'D5764607523190212719',
'D5764607646771185390',
'D5764607654631311297',
'D5764607737431066661',
'D5764607786017883863',
'D5764607581646227268',
'D5764607770905806537',
'D5764607544321115891',
'D5764607540416218840',
'D5764607533202015960',
'D5764607619348826298',
'D5764607754560603875',
'D5764607544220452595',
'D5764607709849323767',
'D5764607644862777070',
'D5764607627095705318',
'D5764607717042554699',
'D5764607672335468236',
'D5764607697681647678',
'D5764607577573557978',
'D5764607666442471139',
'D5764607652102145744',
'D5764607741784754076',
'D5764607683941107567',
'D5764607530001762325',
'D5764607668212467421',
'D5764607559374472929',
'D5764607642878871487',
'D5764607781580310224',
'D5764607696419161858',
'D5764607539552192567',
'D5764607651577857826',
'D5764607643663206335',
'D5764607669009385223',
'D5764607635035523170',
'D5764607700194035728',
'D5764607678241048268',
'D5764607707605370943',
'D5764607641347950652',
'D5764607662378190563',
'D5764607541800339160',
'D5764607709576693784',
'D5764607672545183792',
'D5764607696867952470',
'D5764607545461966544',
'D5764607718451840843',
'D5764607567335261916')	)


delete from "Orders" o where "trackCode" in ('D5764607771182630632',
'D5764607737577867101',
'D5764607780309436352',
'D5764607776396150820',
'D5764607575858087690',
'D5764607677968418911',
'D5764607571919636186',
'D5764607582908712666',
'D5764607557906466570',
'D5764607760604595951',
'D5764607559491913535',
'D5764607524687578833',
'D5764607524670801850',
'D5764607648608290512',
'D5764607662663403235',
'D5764607720314111726',
'D5764607572972406490',
'D5764607682221442811',
'D5764607758385809171',
'D5764607757802800855',
'D5764607788727404258',
'D5764607673941886691',
'D5764607578009765621',
'D5764607690169649177',
'D5764607759707014871',
'D5764607789142640329',
'D5764607605415348250',
'D5764607743374395414',
'D5764607624964998886',
'D5764607772961015504',
'D5764607613715875854',
'D5764607654643894203',
'D5764607541045364444',
'D5764607705734711005',
'D5764607561115109444',
'D5764607697966859997',
'D5764607543566141516',
'D5764607666954176204',
'D5764607771941799656',
'D5764607761124689683',
'D5764607555729622753',
'D5764607673086249008',
'D5764607562432120639',
'D5764607696154920706',
'D5764607652643211172',
'D5764607591666419631',
'D5764607757895075603',
'D5764607791826995305',
'D5764607763150538455',
'D5764607539938068184',
'D5764607773321725641',
'D5764607670729049827',
'D5764607762332649200',
'D5764607718103713611',
'D5764607673035917021',
'D5764607744406193891',
'D5764607701112587997',
'D5764607666748655662',
'D5764607561190606556',
'D5764607558812436215',
'D5764607669881800396',
'D5764607529045460847',
'D5764607670078932701',
'D5764607569256253529',
'D5764607638139307835',
'D5764607754308945703',
'D5764607753516222188',
'D5764607753738520359',
'D5764607700080789213',
'D5764607792879765195',
'D5764607650973878386',
'D5764607686990366493',
'D5764607652639016656',
'D5764607523190212719',
'D5764607646771185390',
'D5764607654631311297',
'D5764607737431066661',
'D5764607786017883863',
'D5764607581646227268',
'D5764607770905806537',
'D5764607544321115891',
'D5764607540416218840',
'D5764607533202015960',
'D5764607619348826298',
'D5764607754560603875',
'D5764607544220452595',
'D5764607709849323767',
'D5764607644862777070',
'D5764607627095705318',
'D5764607717042554699',
'D5764607672335468236',
'D5764607697681647678',
'D5764607577573557978',
'D5764607666442471139',
'D5764607652102145744',
'D5764607741784754076',
'D5764607683941107567',
'D5764607530001762325',
'D5764607668212467421',
'D5764607559374472929',
'D5764607642878871487',
'D5764607781580310224',
'D5764607696419161858',
'D5764607539552192567',
'D5764607651577857826',
'D5764607643663206335',
'D5764607669009385223',
'D5764607635035523170',
'D5764607700194035728',
'D5764607678241048268',
'D5764607707605370943',
'D5764607641347950652',
'D5764607662378190563',
'D5764607541800339160',
'D5764607709576693784',
'D5764607672545183792',
'D5764607696867952470',
'D5764607545461966544',
'D5764607718451840843',
'D5764607567335261916')


select "createdAt"  from "Orders" o where "trackCode" in ('D5764607771182630632',
'D5764607737577867101',
'D5764607780309436352',
'D5764607776396150820',
'D5764607575858087690',
'D5764607677968418911',
'D5764607571919636186',
'D5764607582908712666',
'D5764607557906466570',
'D5764607760604595951',
'D5764607559491913535',
'D5764607524687578833',
'D5764607524670801850',
'D5764607648608290512',
'D5764607662663403235',
'D5764607720314111726',
'D5764607572972406490',
'D5764607682221442811',
'D5764607758385809171',
'D5764607757802800855',
'D5764607788727404258',
'D5764607673941886691',
'D5764607578009765621',
'D5764607690169649177',
'D5764607759707014871',
'D5764607789142640329',
'D5764607605415348250',
'D5764607743374395414',
'D5764607624964998886',
'D5764607772961015504',
'D5764607613715875854',
'D5764607654643894203',
'D5764607541045364444',
'D5764607705734711005',
'D5764607561115109444',
'D5764607697966859997',
'D5764607543566141516',
'D5764607666954176204',
'D5764607771941799656',
'D5764607761124689683',
'D5764607555729622753',
'D5764607673086249008',
'D5764607562432120639',
'D5764607696154920706',
'D5764607652643211172',
'D5764607591666419631',
'D5764607757895075603',
'D5764607791826995305',
'D5764607763150538455',
'D5764607539938068184',
'D5764607773321725641',
'D5764607670729049827',
'D5764607762332649200',
'D5764607718103713611',
'D5764607673035917021',
'D5764607744406193891',
'D5764607701112587997',
'D5764607666748655662',
'D5764607561190606556',
'D5764607558812436215',
'D5764607669881800396',
'D5764607529045460847',
'D5764607670078932701',
'D5764607569256253529',
'D5764607638139307835',
'D5764607754308945703',
'D5764607753516222188',
'D5764607753738520359',
'D5764607700080789213',
'D5764607792879765195',
'D5764607650973878386',
'D5764607686990366493',
'D5764607652639016656',
'D5764607523190212719',
'D5764607646771185390',
'D5764607654631311297',
'D5764607737431066661',
'D5764607786017883863',
'D5764607581646227268',
'D5764607770905806537',
'D5764607544321115891',
'D5764607540416218840',
'D5764607533202015960',
'D5764607619348826298',
'D5764607754560603875',
'D5764607544220452595',
'D5764607709849323767',
'D5764607644862777070',
'D5764607627095705318',
'D5764607717042554699',
'D5764607672335468236',
'D5764607697681647678',
'D5764607577573557978',
'D5764607666442471139',
'D5764607652102145744',
'D5764607741784754076',
'D5764607683941107567',
'D5764607530001762325',
'D5764607668212467421',
'D5764607559374472929',
'D5764607642878871487',
'D5764607781580310224',
'D5764607696419161858',
'D5764607539552192567',
'D5764607651577857826',
'D5764607643663206335',
'D5764607669009385223',
'D5764607635035523170',
'D5764607700194035728',
'D5764607678241048268',
'D5764607707605370943',
'D5764607641347950652',
'D5764607662378190563',
'D5764607541800339160',
'D5764607709576693784',
'D5764607672545183792',
'D5764607696867952470',
'D5764607545461966544',
'D5764607718451840843',
'D5764607567335261916')






