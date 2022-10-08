select extra -> 'enterpriseHook'->>'4581', * from "GeneralTypes" gt where extra -> 'enterpriseHook'->>'4581' is not null order by subtype 



select * from "OrderService" os where "orderID" = '1002540'


select "hooksHeaders" , "urlWebHook" , "structureWebHook" , "contentTypeWebHook" ,
"typeWebHook" , "queryHooks" , "methodWebHook" , "authTokenHooks" 
from "Enterprises" e where id = 4581


select o."updatedAt" as "timestamp", o."trackCode" as "delivery_code", gt.subclass  as "delivery_status", 
concat('https://nintendo.chazki.com/trackcodeTracking/',o."trackCode") as "url_delivery_code" from "Orders" o
left join "GeneralTypes" gt on o."statusID" = gt.subtype 
where "trackCode" in ('CKI1660674297148ZKI',
'CKI1660674692858BVE',
'CKI1660682852374QIJ',
'CKI1660743025876XXI',
'CKI1660743147718CBY',
'CKI1660743460501EVZ',
'CKI1660743478617FFM',
'CKI1660743501309MSF',
'CKI1660743716348SBP',
'CKI1660743887883OQD',
'CKI1660744002749GSP',
'CKI1660744022551VJE',
'CKI1660744203223XZR',
'CKI1660744413263FGP',
'CKI1660744544634HJB',
'CKI1660744675379BXP',
'CKI1660744752584GWY',
'CKI1660744767188WNQ',
'CKI1660744775144DGZ',
'CKI1660744828775AOS',
'CKI1660745043240KST',
'CKI1660745082632SYM',
'CKI1660745167403MWH',
'CKI1660745224131BRX',
'CKI1660745317485RDC',
'CKI1660745742116EIP',
'CKI1660745742386DRC',
'CKI1660745883378HBQ',
'CKI1660745898781VCM',
'CKI1660745958574XEB',
'CKI1660745960159KQN',
'CKI1660746076085DRA',
'CKI1660746271027VYS',
'CKI1660746335938NJZ',
'CKI1660746751477UHA',
'CKI1660746956386SBB',
'CKI1660746988318GQJ',
'CKI1660747205016COA',
'CKI1660747401757SKG',
'CKI1660747843519UMT',
'CKI1660748439242RCE',
'CKI1660748464124XFM',
'CKI1660748555167VLW',
'CKI1660748615153NBC',
'CKI1660748663318KIF',
'CKI1660748679245ANM',
'CKI1660748804063EAG',
'CKI1660748959707BJG',
'CKI1660749528387ABF',
'CKI1660749560540JFT',
'CKI1660749839497HKC',
'CKI1660749869182URB',
'CKI1660749922182JOH',
'CKI1660750100441WWB',
'CKI1660750121667DIQ',
'CKI1660750363324PPD',
'CKI1660750402505PAZ',
'CKI1660750500466EUN',
'CKI1660750742449OUK',
'CKI1660750818347VSP',
'CKI1660750971973EPH',
'CKI1660751066637ZST',
'CKI1660751109336UFO',
'CKI1660751414496QNL',
'CKI1660751488627CLZ',
'CKI1660751662624NVX',
'CKI1660751843291GAA',
'CKI1660751848740WIA',
'CKI1660751886868JRA',
'CKI1660752423560OUB',
'CKI1660752495914KRW',
'CKI1660753413756XND',
'CKI1660753498969OBM',
'CKI1660753576513IJB',
'CKI1660753792153CCQ',
'CKI1660753946083VQP',
'CKI1660754069000TFN',
'CKI1660754148778YOE',
'CKI1660754817802FNQ',
'CKI1660755484239BMW',
'CKI1660755785920OTW',
'CKI1660755893182RCA',
'CKI1660756108535TIZ',
'CKI1660756290561RUJ',
'CKI1660756628862IBN',
'CKI1660756743450OSE',
'CKI1660756989467BNY',
'CKI1660757170110DDJ',
'CKI1660757511103STN',
'CKI1660757730451TCC',
'CKI1660757834007SGL',
'CKI1660757972272XGP',
'CKI1660758682672KWX',
'CKI1660758967799LCX',
'CKI1660759051850NTU',
'CKI1660759281906WHJ',
'CKI1660759603123GWY',
'CKI1660759853165TPR',
'CKI1660759984327XWQ',
'CKI1660760026161MJL',
'CKI1660760037879OQQ',
'CKI1660760097234YLU',
'CKI1660760127155FPH',
'CKI1660760168341DVU',
'CKI1660760537366UMB',
'CKI1660760541903DKN',
'CKI1660760779491SSX',
'CKI1660760926387OKP',
'CKI1660761433145XCL',
'CKI1660761974802LSQ',
'CKI1660762132546KED',
'CKI1660762155234QAN',
'CKI1660762192970LZG',
'CKI1660762727931QCQ',
'CKI1660767645276JGV',
'CKI1660768122239VJI',
'CKI1660768491751EOF',
'CKI1660770026810MBE',
'CKI1660771675014LGA',
'CKI1660829925882EGH',
'CKI1660830515041RSO',
'CKI1660830620895FRS',
'CKI1660830782663HYS',
'CKI1660831114867PUR',
'CKI1660831186271YPG',
'CKI1660831331389DCL',
'CKI1660831395836OLH',
'CKI1660831403596JJL',
'CKI1660831639395DSP',
'CKI1660831698476BUR',
'CKI1660831791947FUJ',
'CKI1660831806153XTN',
'CKI1660831824796HNG',
'CKI1660831861750ZLY',
'CKI1660831911383PSS',
'CKI1660831915979PSG',
'CKI1660831980188MMO',
'CKI1660832107262OLK',
'CKI1660832206521BOW',
'CKI1660832433296QXQ',
'CKI1660832443412EVQ',
'CKI1660832580188DLA',
'CKI1660833472932CEF',
'CKI1660833608598ZMI',
'CKI1660834378932OGX',
'CKI1660834669413CDS',
'CKI1660835429910XAE',
'CKI1660835504532NRM',
'CKI1660835559477ZOH',
'CKI1660835580356VDZ',
'CKI1660835688311UDV',
'CKI1660837424018ZJS',
'CKI1660837651899EBP',
'CKI1660838127500MZT',
'CKI1660838181419HKF',
'CKI1660838242162BFB',
'CKI1660838565367EDN',
'CKI1660838605121PIJ',
'CKI1660838747376BUV',
'CKI1660839295749WKS',
'CKI1660839541281WNZ',
'CKI1660839545390DNO',
'CKI1660839583970IWJ',
'CKI1660840360086HFB',
'CKI1660840369062ZYJ',
'CKI1660841079450KNA',
'CKI1660841088751CTP',
'CKI1660841218140RSC',
'CKI1660841343801XAO',
'CKI1660841429830BAC',
'CKI1660841610791LEM',
'CKI1660841795799FPW',
'CKI1660842051086GVH',
'CKI1660842521961RNS',
'CKI1660843468160IMZ',
'CKI1660844564605OFU',
'CKI1660844781154UZV',
'CKI1660845140821KRV',
'CKI1660845179631IEC',
'CKI1660846086845ZNS',
'CKI1660846438551GIO',
'CKI1660851861907VLU',
'CKI1660852199227WNP',
'CKI1660855076176TRI',
'CKI1660914727123DRW',
'CKI1660915739504UWS',
'CKI1660916629884VTA',
'CKI1660917521653XKO',
'CKI1660917525397UOX',
'CKI1660917734557LFF',
'CKI1660918100127CPR',
'CKI1660918411383IEV',
'CKI1660918674501STE',
'CKI1660919891805YRV',
'CKI1660919940072BAT',
'CKI1660920261485DLC',
'CKI1660920920151TCY',
'CKI1660921371351GVE',
'CKI1660921421024YHA',
'CKI1660921439040WZI',
'CKI1660922296316CWE',
'CKI1660922609122ROE',
'CKI1660922921462ANN',
'CKI1660923518048QNR',
'CKI1660923772861IEE',
'CKI1660923784426FUT',
'CKI1660923858849BOT',
'CKI1660924070076OHG',
'CKI1660924133208KEQ',
'CKI1660924298309FYT',
'CKI1660924654385MLO',
'CKI1660924734989TBO',
'CKI1660925042474JZH',
'CKI1660925530950CTH',
'CKI1660926034271VYQ',
'CKI1660926895743JTK',
'CKI1660926949374ZPB',
'CKI1660927381516GHL',
'CKI1660927591696MSW',
'CKI1660927893741XTZ',
'CKI1660928056357NYQ',
'CKI1660928530137JMG',
'CKI1660928567416OLP',
'CKI1660929085982WVR',
'CKI1660929284182QUX',
'CKI1660930959739JJK',
'CKI1660933259593IAU',
'CKI1660933411037XHG',
'CKI1660934685929DEY',
'CKI1660936569117CAS',
'CKI1661002279792GQO',
'CKI1661002364976CDC',
'CKI1661002516868RMI',
'CKI1661002585678EPV',
'CKI1661002770423RGE',
'CKI1661002781934LOZ',
'CKI1661002837022TOE',
'CKI1661003143415IDW',
'CKI1661003299378DVQ',
'CKI1661003362093KBA',
'CKI1661003504702PNF',
'CKI1661003585646NNV',
'CKI1661004031439XGX',
'CKI1661004067783AEU',
'CKI1661004141878ADR',
'CKI1661004354725BPR',
'CKI1661004466780DUF',
'CKI1661004522392WRJ',
'CKI1661004553661MYJ',
'CKI1661005106909CHZ',
'CKI1661005233067YDD',
'CKI1661006185708JSL',
'CKI1661006360472LTG',
'CKI1661006452272HVJ',
'CKI1661007378809YCB',
'CKI1661007586471PPG',
'CKI1661008225879DVJ',
'CKI1661008550453ESO',
'CKI1661008551749DKS',
'CKI1661008839387SDG',
'CKI1661009085478GDM',
'CKI1661009156336TLA',
'CKI1661009348418APF',
'CKI1661009404477TUB',
'CKI1661009483621NUQ',
'CKI1661010392038BSC',
'CKI1661010998696YZD',
'CKI1661011146913PUA',
'CKI1661011624678JUK',
'CKI1661011784154IFX',
'CKI1661011950311CBM',
'CKI1661013020496CKT',
'CKI1661013148034GVX',
'CKI1661017597478JTU',
'CKI1661018595646ZWR',
'CKI1661019395425OCX',
'CKI1661021027518WEG',
'CKI1661022405939OPV',
'CKI1661023237992AVW',
'CKI1661023479760BZD',
'CKI1661023869515XSO',
'CKI1661088396277FUE',
'CKI1661089240034BBD',
'CKI1661089662542TJH',
'CKI1661089669053TUZ',
'CKI1661089707783AJP',
'CKI1661090250316BSJ',
'CKI1661090328870YKV',
'CKI1661090461499UAN',
'CKI1661091524144QEI',
'CKI1661091743140HWY',
'CKI1661092279641QHX',
'CKI1661092421552WNA',
'CKI1661093021334MXP',
'CKI1661093164170HSX',
'CKI1661093223986TXO',
'CKI1661093436138RER',
'CKI1661093562356PLT',
'CKI1661093624493KIG',
'CKI1661094832278BTO',
'CKI1661095124651TQD',
'CKI1661096775731PZW',
'CKI1661096984744AUF',
'CKI1661097439017GYC',
'CKI1661097536279AVM',
'CKI1661097620165ZNE',
'CKI1661098247953SNA',
'CKI1661098448869CBB',
'CKI1661099209547JCN',
'CKI1661102891530WKP',
'CKI1661103335027RGK',
'CKI1661104278965NMT',
'CKI1661104314083OXZ',
'CKI1661104933314HZR',
'CKI1661105587768DCK',
'CKI1661106639739VHV',
'CKI1661107696506NSP',
'CKI1661108341184CII',
'CKI1661108958104JUK',
'CKI1661109623749FEE',
'CKI1661175341888DRV',
'CKI1661175827376FJY',
'CKI1661176114118RVN',
'CKI1661176198190FAZ',
'CKI1661176262715PXB',
'CKI1661176416462EZZ',
'CKI1661176429544TOE',
'CKI1661176464025PVY',
'CKI1661176919846MZQ',
'CKI1661177326629XBJ',
'CKI1661177399230LRR',
'CKI1661177433683DGN',
'CKI1661177502087REL',
'CKI1661177696480HBG',
'CKI1661177802073PJU',
'CKI1661177859929BER',
'CKI1661177969738AJJ',
'CKI1661178170450SLC',
'CKI1661178288776XQR',
'CKI1661178712348WOO',
'CKI1661179145446OOR',
'CKI1661179204952HUL',
'CKI1661179300136WWF',
'CKI1661179445314KYE',
'CKI1661180199842PIM',
'CKI1661180795200GUW',
'CKI1661180795429RRP',
'CKI1661181485338XTJ',
'CKI1661182021702SSR',
'CKI1661182477590CRY',
'CKI1661182819305NDA',
'CKI1661185070420QAF',
'CKI1661185380377QID',
'CKI1661185503400ZEP',
'CKI1661187832483OTC',
'CKI1661189695005BYG',
'CKI1661192409208CWP',
'CKI1661192631755QOU',
'CKI1661193487838LXE',
'CKI1661193655644VOL',
'CKI1661193813803AJC',
'CKI1661267849395KYF',
'CKI1661268744555LIV',
'CKI1661268908586EQI',
'CKI1661269393026CNU',
'CKI1661269529580HQW',
'CKI1661270577670TVR',
'CKI1661271087709PSO',
'CKI1661271263466JUG',
'CKI1661271326312RTS',
'CKI1661271680402CEX',
'CKI1661271866781NOS',
'CKI1661272312509LVG',
'CKI1661272550588RBW',
'CKI1661272610421GQO',
'CKI1661272664998OSF',
'CKI1661272819507XIH',
'CKI1661273435117DKE',
'CKI1661273503277KVX',
'CKI1661273949433CEK',
'CKI1661273999494VSL',
'CKI1661274661578UOD',
'CKI1661274770727RSA',
'CKI1661274830230JHA',
'CKI1661275022342IIY',
'CKI1661275690391FAH',
'CKI1661276455715TRH',
'CKI1661276526247HUP',
'CKI1661276968888ABH',
'CKI1661277013564RSF',
'CKI1661277233622KEA',
'CKI1661277350931URK',
'CKI1661278851371FOK',
'CKI1661279200292ZTH',
'CKI1661279521091MER',
'CKI1661279766898ASP',
'CKI1661280259026APC',
'CKI1661280427493WYL',
'CKI1661282114336NSE',
'CKI1661283266649OZD',
'CKI1661284144942HBK',
'CKI1661285140309OHS',
'CKI1661285219977XTD',
'CKI1661285761410ACS',
'CKI1661286681513KRN',
'CKI1661287199935UZG',
'CKI1661289181118WWD',
'CKI1661295387808PDP',
'CKI1661348833991WKV',
'CKI1661349378081EHI',
'CKI1661349648924IFV',
'CKI1661349802675YQI',
'CKI1661349937837TSI',
'CKI1661350041140AAC',
'CKI1661350240751ZBS',
'CKI1661350311407OFA',
'CKI1661350529292UJQ',
'CKI1661350641011VBV',
'CKI1661350791968DCO',
'CKI1661351000047SZE',
'CKI1661351285797MJA',
'CKI1661351350137WBE',
'CKI1661351455838AOZ',
'CKI1661351486890JEF',
'CKI1661351622117ARW',
'CKI1661351767351BOR',
'CKI1661351827104IKZ',
'CKI1661352460217DUT',
'CKI1661352612149PHA',
'CKI1661352907258VWV',
'CKI1661353303716NCS',
'CKI1661353377328FOH',
'CKI1661354342222YHX',
'CKI1661354435172DOL',
'CKI1661354922550SWN',
'CKI1661355526053VPP',
'CKI1661355754413FBF',
'CKI1661356029720RIA',
'CKI1661356258834QXA',
'CKI1661356281757DHA',
'CKI1661356616571KDN',
'CKI1661356772559FKK',
'CKI1661356805166FHJ',
'CKI1661356928472XPU',
'CKI1661356958598MRD',
'CKI1661357027764XKB',
'CKI1661357051427QUZ',
'CKI1661357059263XRS',
'CKI1661357347361WAH',
'CKI1661357354406BOW',
'CKI1661357362819PCT',
'CKI1661357423891XYW',
'CKI1661357523696HPV',
'CKI1661357843245BGQ',
'CKI1661358032332EZA',
'CKI1661358056007JZE',
'CKI1661358471819KPZ',
'CKI1661358508280VJM',
'CKI1661358510791SGC',
'CKI1661358657727KJC',
'CKI1661358706604ATH',
'CKI1661358715280KHO',
'CKI1661359334702LUV',
'CKI1661359585440WKZ',
'CKI1661359856553JND',
'CKI1661359922882TNZ',
'CKI1661360108843DAR',
'CKI1661360153712ATQ',
'CKI1661362771162RGS',
'CKI1661362906218LHH',
'CKI1661362926243IGV',
'CKI1661363684527GOM',
'CKI1661364555348XTR',
'CKI1661364584723WYD',
'CKI1661364673294PNC',
'CKI1661365668485MXD',
'CKI1661365688091OWM',
'CKI1661365822497QOY',
'CKI1661366000529SDU',
'CKI1661366121084DQI',
'CKI1661366383244MAG',
'CKI1661367127855JGF',
'CKI1661368246973YEF',
'CKI1661368830911GFS',
'CKI1661369937410JJD',
'CKI1661371836375MQL',
'CKI1661371982848WXE',
'CKI1661374143457NBZ',
'CKI1661374559641PEQ',
'CKI1661374839857RVC',
'CKI1661374940166BMH',
'CKI1661375997487WFA',
'CKI1661376454249DWM',
'CKI1661377369708DUF',
'CKI1661377370738BMG',
'CKI1661377760698VPC',
'CKI1661434587169TAJ',
'CKI1661434955683YAC',
'CKI1661434974869TPS',
'CKI1661435098930KHH',
'CKI1661435107294WLS',
'CKI1661435151261WGL',
'CKI1661435241411GIM',
'CKI1661435472737MQZ',
'CKI1661435637831FXR',
'CKI1661435912521LCP',
'CKI1661436045173FTV',
'CKI1661436178013WDY',
'CKI1661436355106XCL',
'CKI1661436432702BDA',
'CKI1661436438414RXW',
'CKI1661437274359VGK',
'CKI1661437544096YIP',
'CKI1661437959437SDP',
'CKI1661438768225DJC',
'CKI1661439129301CCW',
'CKI1661439147250BML',
'CKI1661439370674ROJ',
'CKI1661439425615UWR',
'CKI1661439598447UWI',
'CKI1661439652867JCZ',
'CKI1661440017553QEQ',
'CKI1661440592221SQM',
'CKI1661440606984ZXU',
'CKI1661441344945PZV',
'CKI1661441419967CGN',
'CKI1661441437935QLV',
'CKI1661441777427AHM',
'CKI1661442254423ZOG',
'CKI1661442328481BFZ',
'CKI1661442329129JHS',
'CKI1661442559286AWC',
'CKI1661442853013IPS',
'CKI1661442964429XJV',
'CKI1661443449409PYP',
'CKI1661443627316BSQ',
'CKI1661444072702GZZ',
'CKI1661444790119NHS',
'CKI1661445300169XQZ',
'CKI1661448244634LUU',
'CKI1661448581211XCV',
'CKI1661449002097ACL',
'CKI1661449540125BEP',
'CKI1661450745447JJY',
'CKI1661450931798FRW',
'CKI1661454544364QMD',
'CKI1661454783715CJA',
'CKI1661455529361LZE',
'CKI1661457241239LVS',
'CKI1661520182595BAC',
'CKI1661520605288TGO',
'CKI1661521283494UTT',
'CKI1661521328914ELS',
'CKI1661521380858LMJ',
'CKI1661521421515OZQ',
'CKI1661521607141VZJ',
'CKI1661522475738XCT',
'CKI1661522493503THQ',
'CKI1661523004729REG',
'CKI1661523111099LOY',
'CKI1661523208995XTL',
'CKI1661523464006ITF',
'CKI1661523843749EUA',
'CKI1661523935697PER',
'CKI1661523967116MER',
'CKI1661523994264MLB',
'CKI1661524093282YEN',
'CKI1661524138743UZB',
'CKI1661524295062TLC',
'CKI1661524638586TEW',
'CKI1661525069117XZN',
'CKI1661525239772ZOZ',
'CKI1661525483060BCA',
'CKI1661525689939DRZ',
'CKI1661526404627WCP',
'CKI1661526771576IAB',
'CKI1661527336827OMW',
'CKI1661527436464DYS',
'CKI1661527464986NZH',
'CKI1661527655430KOO',
'CKI1661527670523RMH',
'CKI1661527952613KXC',
'CKI1661527962375TXN',
'CKI1661528738604YBZ',
'CKI1661529267841IUE',
'CKI1661529606974ZRX',
'CKI1661529676688LKK',
'CKI1661529885486FIY',
'CKI1661530311473QJQ',
'CKI1661530519033KFR',
'CKI1661530656958WIB',
'CKI1661531053677VVH',
'CKI1661608212840NBL',
'CKI1661609263978IXE',
'CKI1661609342900ZAG',
'CKI1661609916368CYL',
'CKI1661610020833QJP',
'CKI1661610202678SWI',
'CKI1661610356571DUL',
'CKI1661610884211SHP',
'CKI1661611088638CMH',
'CKI1661612060778CEY',
'CKI1661614163243NFX',
'CKI1661614588648QVO',
'CKI1661614661882SVP',
'CKI1661614900562KGK',
'CKI1661615014645HXM',
'CKI1661615631757BZU',
'CKI1661781950146RWM',
'CKI1661784823470XGK',
'CKI1661785447777VCV',
'CKI1661785597699YAB',
'CKI1661789284544QDY')