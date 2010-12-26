class IstatusMocker
  
  class << self
    def fake_login(host)
      FakeWeb.register_uri(:get, "http://#{host}/",
                           'content-type'=>"text/html", 
                           :body => LOGIN_PAGE_HTML)
      FakeWeb.register_uri(:post,"http://#{host}/UserLoginSubmit.php",
                           'content-type'=>"text/html",
                           :body => "logged in")
    end
    
    def fake_medic_path(host)
      fake_login(host)
      FakeWeb.register_uri(:get,"https://#{host}/AjaxTS2.php",
                            'content-type'=>"text/html",
                            :body => MEDIC_PAGE_HTML)
    end
    
    def fake_call_path(host,incident_number)
      fake_login(host)
      FakeWeb.register_uri(:get,"https://#{host}/DisplayCall.php?Incid=#{incident_number}",
                           'content-type'=>"text/html",
                           :body => INCIDENT_HTML)
    end
    
    def fake_call_table_path(host)
      fake_login(host)
      FakeWeb.register_uri(:get,"https://#{host}/AjaxDC2.php",
                            'content-type'=>"text/html",
                            :body => CALL_LIST_HTML)
    end
  end
  
  CALL_LIST_HTML = "/*{\"calls\":[{\"incnum\":\"<td class=Status style=><a href='DisplayCall.php?Incid=201023885' target=Fire>201023885&nbsp;</a></td>\",\"time\":\"13:49\",\"pri\":\"5\",\"tac\":\"CF1            \",\"addr\":\"1 BROADWAY E-CO.C1\",\"bldg\":\"BACK & NECK PAIN CENTER                                                    \",\"grid\":\"28123S  \",\"firearea\":\"112C\",\"nature\":\"55B4-ELCTRL ODOR                                  \",\"units\":\"<SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"INC\\\"><a href=ApparatusDetail.php?TruckID=SNZ1 CLASS=\\\"INC\\\"> SNZ1m</a></SPAN> \",\"dispcode\":\"SR   \"},{\"incnum\":\"<td class=Status style=background-color:#D6E5EE;><a href='DisplayCall.php?Incid=201023884' target=Fire>201023884&nbsp;</a></td>\",\"time\":\"13:42\",\"pri\":\"3\",\"tac\":\"BF1            \",\"addr\":\"607 SPRINGTIME DR-AS\",\"bldg\":\"                                                                           \",\"grid\":\"3910E   \",\"firearea\":\"17-19A\",\"nature\":\"26C2-SICK PERSON                                  \",\"units\":\"<SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"AVL\\\"><a href=ApparatusDetail.php?TruckID=G1706 CLASS=\\\"AVL\\\"> G1706</a></SPAN> <SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"ONS\\\"><a href=ApparatusDetail.php?TruckID=M241 CLASS=\\\"ONS\\\"> M241m</a></SPAN> \",\"dispcode\":\"FRM  \"},{\"incnum\":\"<td class=Status style=><a href='DisplayCall.php?Incid=201023883' target=Fire>201023883&nbsp;</a></td>\",\"time\":\"13:40\",\"pri\":\"9\",\"tac\":\"AMB            \",\"addr\":\"1600 BROADWAY E-CO\",\"bldg\":\"BOONE HOSPITAL CENTER                                                      \",\"grid\":\"29073S  \",\"firearea\":\"143\",\"nature\":\"RT-ROUTINE TRANSPORT                              \",\"units\":\"<SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"ENH\\\"><a href=ApparatusDetail.php?TruckID=M151 CLASS=\\\"ENH\\\"> M151m</a></SPAN> \",\"dispcode\":\"NA   \"},{\"incnum\":\"<td class=Status style=background-color:#D6E5EE;><a href='DisplayCall.php?Incid=201023879' target=Fire>201023879&nbsp;</a></td>\",\"time\":\"12:55\",\"pri\":\"9\",\"tac\":\"CF1            \",\"addr\":\"201 ORR ST-CO\",\"bldg\":\"COLUMBIA FIRE DEPT STATION 1                                               \",\"grid\":\"29073P  \",\"firearea\":\"154\",\"nature\":\"TRA-TRAINING                                      \",\"units\":\"<SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"ONS\\\"><a href=ApparatusDetail.php?TruckID=Q44 CLASS=\\\"ONS\\\"> Q44</a></SPAN> <SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"ONS\\\"><a href=ApparatusDetail.php?TruckID=Q6 CLASS=\\\"ONS\\\"> Q6m</a></SPAN> <SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"ONS\\\"><a href=ApparatusDetail.php?TruckID=Q8 CLASS=\\\"ONS\\\"> Q8</a></SPAN> <SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"ONS\\\"><a href=ApparatusDetail.php?TruckID=L1 CLASS=\\\"ONS\\\"> L1</a></SPAN> \",\"dispcode\":\"NA   \"},{\"incnum\":\"<td class=Status style=><a href='DisplayCall.php?Incid=201023876' target=Fire>201023876&nbsp;</a></td>\",\"time\":\"12:48\",\"pri\":\"9\",\"tac\":\"AMB            \",\"addr\":\"1600 BROADWAY E-CO\",\"bldg\":\"BOONE HOSPITAL CENTER                                                      \",\"grid\":\"29073S  \",\"firearea\":\"143\",\"nature\":\"LDT-LONG DISTANCE TRANSPORT                       \",\"units\":\"<SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"ENH\\\"><a href=ApparatusDetail.php?TruckID=M113 CLASS=\\\"ENH\\\"> M113m</a></SPAN> \",\"dispcode\":\"NA   \"},{\"incnum\":\"<td class=Status style=background-color:#D6E5EE;><a href='DisplayCall.php?Incid=201023863' target=Fire>201023863&nbsp;</a></td>\",\"time\":\"10:55\",\"pri\":\"9\",\"tac\":\"AMB            \",\"addr\":\"1600 BROADWAY E-CO\",\"bldg\":\"BOONE HOSPITAL CENTER                                                      \",\"grid\":\"29073S  \",\"firearea\":\"143\",\"nature\":\"LDT-LONG DISTANCE TRANSPORT                       \",\"units\":\"<SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"ONH\\\"><a href=ApparatusDetail.php?TruckID=M112 CLASS=\\\"ONH\\\"> M112m</a></SPAN> \",\"dispcode\":\"NA   \"},{\"incnum\":\"<td class=Status style=><a href='DisplayCall.php?Incid=201023861' target=Fire>201023861&nbsp;</a></td>\",\"time\":\"10:46\",\"pri\":\"9\",\"tac\":\"AMB            \",\"addr\":\"1 HOSPITAL DR-CO\",\"bldg\":\"UNIVERSITY HOSPITAL & CLIN MU                                              \",\"grid\":\"28134C  \",\"firearea\":\"311\",\"nature\":\"LDT-LONG DISTANCE TRANSPORT                       \",\"units\":\"<SPAN style=\\\"white-space:nowrap;\\\" CLASS=\\\"ONH\\\"><a href=ApparatusDetail.php?TruckID=M212 CLASS=\\\"ONH\\\"> M212m</a></SPAN> \",\"dispcode\":\"LDT  \"}]}*/"
  
  
  LOGIN_PAGE_HTML = %Q{    
    			<HTML>
    			<HEAD>
    				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    				<!--<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">-->
    				<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">				
    				<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
    				<META HTTP-EQUIV="EXPIRES" CONTENT="0">
    				<TITLE>EnRoute I-STATUS - Version 5.10</TITLE>
    				<LINK REL="stylesheet" HREF="DisplayFormat.css" TYPE="text/css">
    				            <script language="javascript">
                   //bring the page to foreground
                   this.focus();
                </script>				
    			</HEAD>
    			<BODY CLASS="Maint" onLoad='document.UserForm.UserName.focus();' j=l>
    			<FORM NAME=UserForm METHOD=POST ACTION=UserLoginSubmit.php><BR><BR><CENTER><IMG SRC=I-STATUS.gif><BR><BR><BR><H3 CLASS=Status>User Login</H3><div align='center'><TABLE CLASS='Maint' > 
    <TR > 
    <TD CLASS='Maint' > 
    User Name</TD> 
    <TD CLASS='Maint' > 
    <INPUT TYPE=TEXT NAME=UserName onfocus=this.select() VALUE=></TD> 
    </TR> 
    <TR > 
    <TD CLASS='Maint' > 
    Password</TD> 
    <TD CLASS='Maint' > 
    <INPUT TYPE=PASSWORD NAME=Password onfocus=this.select() VALUE=></TD> 
    </TR> 
    </TABLE></div> 
    <BR><BR><INPUT TYPE=SUBMIT VALUE='Login' CLASS=Maint><BR><BR><BR><center>Copyright &#169; 2010 Infor. All rights reserved. <a target='new' href='http://www.enroute911.com'>www.enroute911.com</a>.</center></FORM>			
    			</BODY>
    			</HTML>    
  }
  
  MEDIC_PAGE_HTML = %Q{
    <html><head>

    	<title>EnRoute I-STATUS - Version 5.10</title>
    	<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type">
    <!-- MJG 2606995 remove EnRoute Banner from page to recover surface space. was Rows=60 changed to Rows = 0 to get space -->
    </head><frameset border="0" framespacing="0" frameborder="no" rows="0,*,">
    	<frame scrolling="no" allowtransparency="true" frameborder="0" marginheight="0" marginwidth="0" noresize="" name="Topper" src="NewDispatchNav.php">
    	  <html><head>			


        				<!--<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">-->
        				<meta content="text/html; charset=windows-1252" http-equiv="Content-Type">				
        				<meta content="NO-CACHE" http-equiv="PRAGMA">
        				<meta content="0" http-equiv="EXPIRES">
        				<title>EnRoute I-STATUS - Version 5.10</title>
        				<link type="text/css" href="DisplayFormat.css" rel="stylesheet">
        				            <script language="javascript">
                       //bring the page to foreground
                       this.focus();
                    </script>				
        			</head><body j="l" style="margin: 0px;" class="Nav">
        			<img hspace="0" height="60" align="left" src="I-STATUSLong1.jpg"><img width="100%" hspace="0" align="left" src="I-STATUSLong3.jpg">			
        			<script language="javascript">
        function ToggleMode() {
        	var cname="NiteMode";
        	var mode=ReadCookie(cname); 
        	if (mode == "") mode="Day";
        	if (mode == "Day") {
        		var newmode="Nite";
        	} else {
        		var newmode="Day";
        	}
        	WriteCookie("NiteMode",newmode,1);
        	if (window.parent.frames.length == 0) {
        		window.self.location.href=window.self.location.href;
        	} else {
        		for (i=0; i&lt;window.parent.frames.length; i++)
        			window.parent.frames(i).location.href=window.parent.frames(i).location.href;
        	}
        }

        function popup(URL) {
        	opts="'toolbar=0, scrollbars=0, location=0, menubar=0, resizable=0, width=160,"
        	opts=opts + "height=200, top=60, left=60'"
        	mywindow=window.open(URL, "newwin",opts);
        	if (mywindow.opener == null)
        		mywindow.opener=self;
        }

        function RestrictZone(type) {
        	switch (type){
        		case 'AZ': 
        			zones=ADZones.value;
        			allowstr="";
        			cookiename="ADZones";
        			break;
        		case 'AN': 
        			zones=ADNats.value;
        			allowstr="";
        			cookiename="ADNats";
        			break;			
        		case 'PZ':
        			zones=PDZones.value;
        			allowstr="";
        			cookiename="PDZones";
        			break;
        		case 'PD':
        			zones=PDIDs.value;
        			allowstr="";
        			cookiename="PDIDs";
        			break;		
        		case 'PG':
        			zones=PDGrids.value;
        			allowstr="";
        			cookiename="PDGrids";
        			break;
        		case 'PN':
        			zones=PDNats.value;
        			allowstr="";
        			cookiename="PDNats";
        			break;	
        		case 'FT':
        			zones=FDTacs.value;
        			allowstr="";
        			cookiename="FDTacs";
        			break;
        		case 'FD':
        			zones=FDIDs.value;
        			allowstr="";
        			cookiename="FDIDs";
        			break;
        		case 'FG':
        			zones=FDGrids.value;
        			allowstr="";
        			cookiename="FDGrids";
        			break;
        		case 'FN':
        			zones=FDNats.value;
        			allowstr="";
        			cookiename="FDNats";
        			break;
        		case 'DP':
        			zones=FDDsps.value;
        			allowstr="";
        			cookiename="FDDsps";
        			break;	

        		case 'IB':
        			zones=ADInitBy.value;
        			allowstr="";
        			cookiename="ADInitBy";
        			break;		
        	  default:
        	  	zones="";
        	  	allowstr="";
        	  	cookiename="";
        	 }
           var allowed=allowstr;
           var arrZones = new Array();
           if (allowed)
              allowed=allowed.replace(/^\s*|\s*$/g,"");
           //Check if zones entered are allowed
           if (allowed) {
              var trash;
              allowed=" "+allowed+" ";
              arrZones=zones.split(" ");
              //Loop thru each zone in user input
              for (var i = (arrZones.length - 1); i &gt;= 0; i--) {
                 if (allowed.indexOf(" "+arrZones[i]+" ")&lt;0) 
                    trash=arrZones.splice(i,1);
              }
              zones=arrZones.join(" ");
              //If no zone left, retore the default
              if (!zones) { zones=allowed.replace(/^\s*|\s*$/g,""); }
           }
           if (cookiename){
           	WriteCookie(cookiename,zones,1);
           }
        	if (window.parent.frames.length == 0) {
        	   window.self.location.href=window.self.location.href;
        	} else {
        		for (i=0; i&lt;window.parent.frames.length; i++) 
        			window.parent.frames(i).location.href=window.parent.frames(i).location.href;
        	}
        }

        </script>

        <script src="JSFuncs.js" language="JavaScript"></script>
        <script language="JavaScript">
        </script></body></html>
    	</frame>
    	<frame scrolling="no" allowtransparency="true" name="Top" noresize="" marginheight="0" marginwidth="0" frameborder="0" src="Dispatch_center.php">
    	  <html><head><!-- Included file for dropdown menu -->
        <script type="text/javascript">

        </script>
        <script src="JSFuncs.js" language="JavaScript"></script><script language="javascript">
      
        </script> 



        		<!--<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">-->




        		<link type="text/css" href="DisplayFormat.css" rel="stylesheet">

        		<form name="LEAD">
        		<input type="HIDDEN" value="30" name="RefreshInt">
        		<h4 id="shead" class="Status">Apparatus Status - Screen 4</h4>
        		<center><b>Status Legend:</b>&nbsp;
        		<span class="ENR">     ENR</span>&nbsp;
        		<span class="ONS">     ONS</span>&nbsp;
        		<span class="AVL">     AVL</span>&nbsp;
        		<span class="OOS">     OOS</span>&nbsp;
        		<span class="OOD">     OOD</span>&nbsp;
        		<span class="INC">     INC</span>&nbsp;
        		<span class="TRN">     TRN</span>&nbsp;
        		<span class="DSP">     DSP</span>&nbsp;
        		<span class="ARV">     At Hosp</span>&nbsp;
        		<span class="AAS">     AAS</span></center>

        		<div align="center" id="Scrollable" class="ScrollBody" style="height: 96px;"><div style="position: absolute; left: 280.5px;" id="Scrollable2"><span style="position: absolute; top: 0px; left: 235px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=AMBULANCES          ">AMBULANCES          </a></span><span style="position: absolute; top: 275px; left: 10px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=22 ELLIS FISCHEL    ">22 ELLIS FISCHEL    </a></span><span style="position: absolute; top: 300px; left: 10px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=23 WOODRAIL CENTER  ">23 WOODRAIL CENTER  </a></span><span style="position: absolute; top: 325px; left: 10px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=24 ASHLAND          ">24 ASHLAND          </a></span><span style="position: absolute; top: 250px; left: 315px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=25 MIDWAY           ">25 MIDWAY           </a></span><span style="position: absolute; top: 275px; left: 315px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=26 ROCHEPORT        ">26 ROCHEPORT        </a></span><span style="position: absolute; top: 50px; left: 160px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=M111                ">M111                m</a></span><span style="position: absolute; top: 75px; left: 160px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M121                ">M121                </a></span><span style="position: absolute; top: 100px; left: 160px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=M131                ">M131                m</a></span><span style="position: absolute; top: 125px; left: 160px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M141                ">M141                </a></span><span style="position: absolute; top: 50px; left: 460px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=M151                ">M151                m</a></span><span style="position: absolute; top: 50px; left: 10px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=11 VANDIVER         ">11 VANDIVER         </a></span><span style="position: absolute; top: 75px; left: 460px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M181                ">M181                </a></span><span style="position: absolute; top: 100px; left: 460px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M191                ">M191                </a></span><span style="position: absolute; top: 250px; left: 160px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=M211                ">M211                m</a></span><span style="position: absolute; top: 275px; left: 160px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=M221                ">M221                m</a></span><span style="position: absolute; top: 300px; left: 160px; white-space: nowrap; font-size: x-small;" class="AOS"><a target="Fire" class="AOS" href="ApparatusDetail.php?TruckID=M231                ">M231                m</a></span><span style="position: absolute; top: 325px; left: 160px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=M241                ">M241                m</a></span><span style="position: absolute; top: 250px; left: 455px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M251                ">M251                </a></span><span style="position: absolute; top: 275px; left: 455px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M261                ">M261                </a></span><span style="position: absolute; top: 50px; left: 210px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M112                ">M112                </a></span><span style="position: absolute; top: 100px; left: 210px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M132                ">M132                </a></span><span style="position: absolute; top: 75px; left: 10px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=12 PRATHERSVILLE    ">12 PRATHERSVILLE    </a></span><span style="position: absolute; top: 50px; left: 510px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M152                ">M152                </a></span><span style="position: absolute; top: 250px; left: 210px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M212                ">M212                m</a></span><span style="position: absolute; top: 325px; left: 210px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M242                ">M242                </a></span><span style="position: absolute; top: 50px; left: 260px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M113                ">M113                m</a></span><span style="position: absolute; top: 250px; left: 260px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M213                ">M213                </a></span><span style="position: absolute; top: 160px; left: 25px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=EMS10               ">EMS10               </a></span><span style="position: absolute; top: 160px; left: 80px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=EMS11               ">EMS11               </a></span><span style="position: absolute; top: 160px; left: 135px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=EMS13               ">EMS13               </a></span><span style="position: absolute; top: 360px; left: 20px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=EMS2                ">EMS2                </a></span><span style="position: absolute; top: 360px; left: 75px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=EMS21               ">EMS21               </a></span><span style="position: absolute; top: 100px; left: 10px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=13 CENTRALIA        ">13 CENTRALIA        </a></span><span style="position: absolute; top: 360px; left: 130px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=EMS22               ">EMS22               </a></span><span style="position: absolute; top: 360px; left: 185px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=EMS23               ">EMS23               </a></span><span style="position: absolute; top: 360px; left: 240px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=EMS24               ">EMS24               </a></span><span style="position: absolute; top: 160px; left: 230px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=MC115               ">MC115               </a></span><span style="position: absolute; top: 420px; left: 55px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=H1                  ">H1                  </a></span><span style="position: absolute; top: 420px; left: 145px; white-space: nowrap; font-size: x-small;" class="AVL"><a target="Fire" class="AVL" href="ApparatusDetail.php?TruckID=H2                  ">H2                  </a></span><span style="position: absolute; top: 420px; left: 240px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=H3                  ">H3                  </a></span><span style="position: absolute; top: 420px; left: 10px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=Univ:               ">Univ:               </a></span><span style="position: absolute; top: 420px; left: 100px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=Lake:               ">Lake:               </a></span><span style="position: absolute; top: 420px; left: 185px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=Sedalia:            ">Sedalia:            </a></span><span style="position: absolute; top: 125px; left: 10px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=14 STURGEON         ">14 STURGEON         </a></span><span style="position: absolute; top: 420px; left: 400px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=MD10                ">MD10                </a></span><span style="position: absolute; top: 420px; left: 455px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=MD20                ">MD20                </a></span><span style="position: absolute; top: 420px; left: 510px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=MD21                ">MD21                </a></span><span style="position: absolute; top: 420px; left: 285px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=Medical Directors:  ">Medical Directors:  </a></span><span style="position: absolute; top: 300px; left: 315px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=27 KOMU             ">27 KOMU             </a></span><span style="position: absolute; top: 325px; left: 315px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=28 AIRPORT          ">28 AIRPORT          </a></span><span style="position: absolute; top: 300px; left: 455px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M271                ">M271                </a></span><span style="position: absolute; top: 325px; left: 455px; white-space: nowrap; font-size: x-small;" class="OOS"><a target="Fire" class="OOS" href="ApparatusDetail.php?TruckID=M281                ">M281                </a></span><span style="position: absolute; top: 20px; left: 30px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=BOONE AMBULANCE     ">BOONE AMBULANCE     </a></span><span style="position: absolute; top: 215px; left: 30px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=UNIVERSITY AMBULANCE">UNIVERSITY AMBULANCE</a></span><span style="position: absolute; top: 50px; left: 315px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=15 BOONE HOSPITAL   ">15 BOONE HOSPITAL   </a></span><span style="position: absolute; top: 50px; left: 140px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=--                  ">--                  </a></span><span style="position: absolute; top: 250px; left: 140px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=--                  ">--                  </a></span><span style="position: absolute; top: 50px; left: 440px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=--                  ">--                  </a></span><span style="position: absolute; top: 275px; left: 140px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=--                  ">--                  </a></span><span style="position: absolute; top: 300px; left: 140px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=--                  ">--                  </a></span><span style="position: absolute; top: 75px; left: 315px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=18 HWY 63 / I70     ">18 HWY 63 / I70     </a></span><span style="position: absolute; top: 100px; left: 315px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=19 HALLSVILLE       ">19 HALLSVILLE       </a></span><span style="position: absolute; top: 250px; left: 10px; white-space: nowrap; font-size: x-small;" class=""><a target="Fire" class="" href="ApparatusDetail.php?TruckID=21 UNIVERSITY HOSP  ">21 UNIVERSITY HOSP  </a></span>
        </div></div>
        <!--		<br-->
        		<table width="100%" cellspacing="0" cellpadding="1" border="0" align="left">
        		<tbody><tr>
        		<th>Display Apparatus Screen # 
        		<a onclick="TruckScreen(1);" href="#"><b><font color="#ff0000">1 </font></b></a>
        		<a onclick="TruckScreen(2);" href="#"><b><font color="#ff0000">2 </font></b></a>
        		<a onclick="TruckScreen(3);" href="#"><b><font color="#ff0000">3 </font></b></a>
        		<a onclick="TruckScreen(4);" href="#"><b><font color="#ff0000">4 </font></b></a>
        		<a onclick="TruckScreen(5);" href="#"><b><font color="#ff0000">5 </font></b></a>
        		<a onclick="TruckScreen(6);" href="#"><b><font color="#ff0000">6 </font></b></a>
        		<a onclick="TruckScreen(7);" href="#"><b><font color="#ff0000">7 </font></b></a>
        		<a onclick="TruckScreen(8);" href="#"><b><font color="#ff0000">8 </font></b></a>
        		<a onclick="TruckScreen(9);" href="#"><b><font color="#ff0000">9 </font></b></a>
        		<a onclick="TruckScreen(10);" href="#"><b><font color="#ff0000">10 </font></b></a>
        		<a onclick="TruckScreen(11);" href="#"><b><font color="#ff0000">11 </font></b></a>
        		<a onclick="TruckScreen(12);" href="#"><b><font color="#ff0000">12 </font></b></a>
        		<a onclick="TruckScreen(13);" href="#"><b><font color="#ff0000">13 </font></b></a>
        		<a onclick="TruckScreen(14);" href="#"><b><font color="#ff0000">14 </font></b></a>
        		<a onclick="TruckScreen(15);" href="#"><b><font color="#ff0000">15 </font></b></a>
        		</th> 
        		</tr>
        		</tbody></table>		
        		</form>
        	<script src="Ajax.js" language="javascript"></script>
        <script language="javascript">
        
        </script>
        <script src="JSFuncs.js" language="JavaScript"></script>
        </body></html>
    	</frame>

    </frameset>
    <noframes>
    	&lt;BODY &gt;
    		A browser that supports frames is required for this application.
    	&lt;/BODY&gt;
    </noframes>
    </html>
  }
  
  INCIDENT_HTML = %Q{
    
    			<HTML>
    			<HEAD>
    				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    				<!--<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">-->
    				<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">				
    				<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
    				<META HTTP-EQUIV="EXPIRES" CONTENT="0">
    				<TITLE>EnRoute I-STATUS - Version 5.10</TITLE>
    				<LINK REL="stylesheet" HREF="DisplayFormat.css" TYPE="text/css">
    				            <script language="javascript">
                   //bring the page to foreground
                   this.focus();
                </script>				
    			</HEAD>
    			<BODY CLASS="Detail"  j=l>
    			<H3 class="Status">Prior Fire Incident: 201023687</H3><table cellpadding="0" cellspacing="0" width="100%"><tr width="100%"><td valign="top" width="50%"><table cellpadding="0" cellspacing="0" width="100%"><tr><th class="Detail" align="left" width=$cw>Location</th><td class="Detail" align="left" colspan="3"><a href="SearchDStatsSubmit.php?Address=7750 HIGHWAY AB E-BC">7750 HIGHWAY AB E-BC</a></td></tr><tr><TH CLASS='Detail' align=left width=100px> 
    Building</TH> 
    <TD CLASS='Detail' COLSPAN=3> 
                                                                               </TD> 
    </tr>
    <tr>
      <TH CLASS='Detail' align=left width=100px>Nature</TH> 
      <TD CLASS='Detail' COLSPAN=3>23C7V-SML NON DWEL STR FIRE</TD> 
    </tr>
    <tr>
      <TH CLASS='Detail' align=left width=100px>Priority</TH> 
      <TD CLASS='Detail' width=110px>2</TD> 
      <TH CLASS='Detail' align=left width=100px>Dispatch Code</TH> 
      <TD CLASS='Detail' > BOX  </TD> 
    </tr>
    <tr>
      <TH CLASS='Detail' align=left> Grid</TH> 
      <TD CLASS='Detail' width=110px> 34123B    </TD> 
      <TH CLASS='Detail' align=left width=100px> Map</TH> 
      <TD CLASS='Detail' > </TD> 
    </tr>
    <tr>
      <TH CLASS='Detail' align=left> Fire Area</TH> 
      <td class="Detail" COLSPAN="3">19-17B  </td>
    </tr>
    <tr>
      <TH CLASS='Detail' align=left> Cross1</TH> 
      <td class="Detail" COLSPAN="3">RANGELINE RD S</td>
    </tr>
    <tr>
      <TH CLASS='Detail' align=left> Cross2</TH> 
      <td class="Detail" COLSPAN="3">HIGHWAY 63 S SB</td>
    </tr>
    <tr>
      <th class="Detail" align="left">Hyd1</th>
      <td class="Detail" width=$dw></td>
      <th class="Detail" align="left" width=$cw>Hyd2</th>
      <td class="Detail"></td>
    </tr>
    <tr>
      <td colspan="4"><hr color=navy></td>
    </tr>
    <tr>
      TH CLASS='Detail' align=left width=100px> Complainant</TH> 
      <TD CLASS='Detail' colspan=3> JEROME</TD> 
    </tr>
    <tr>
      <TH CLASS='Detail' align=left width=100px> Callback</TH> 
      <TD CLASS='Detail' colspan=3> 5734410736</TD> 
    </tr>
    <tr>
      <th class="Detail" align="left" width=$cw>Dispatcher</th>
      <td class="Detail" width=$dw>AMS  </td>
      <th class="Detail" align="left" width=$cw>CallTaker</th>
      <td class="Detail">ALL  </td>
    </tr>
    <tr>
      <TH CLASS='Detail' align=left width=100px> DispO</TH> 
      <TD CLASS='Detail' > ND</TD> 
      <TH CLASS='Detail' align=left width=100px> Meth. Alarm</TH> 
      <TD CLASS='Detail' > 2         </TD> 
    </tr>
    <tr>
      <td colspan="4"><hr color=navy></td>
    </tr>
    <tr>
      <TH CLASS='Detail' align=left width=100px> Inc Date/Time</TH> 
      <TD CLASS='Detail' colspan=3> 12/19/2010 14:15:05</TD> 
    </tr>
    <tr>
      <TH CLASS='Detail' align=left width=100px> On Scene</TH> 
      <TD CLASS='Detail' colspan=3> 12/19/2010 14:27:09</TD> 
    </tr>
    <tr>
      <TH CLASS='Detail' align=left width=100px> Upgrade</TH> 
      <TD CLASS='Detail' colspan=3> 00:00:00</TD> 
    </tr>
    <tr><TH CLASS='Detail' align=left width=100px> 
    Pat Contact</TH> 
    <TD CLASS='Detail' colspan=3> 
    01/01/1970 00:00:00</TD> 
    </tr></table></td><td valign="top" align="center" width="50%"><table border="1" bordercolor="#76a5b6" cellpadding="0" cellspacing="0" width="90%"><TR > 
    <TH CLASS='Detail' align=left> 
    Apparatus</TH> 
    <TH CLASS='Detail' align="center"> 
    DSP</TH> 
    <TH CLASS='Detail' align="center"> 
    ENR</TH> 
    <TH CLASS='Detail' align="center"> 
    ONS</TH> 
    <TH CLASS='Detail' align="center"> 
    Tran</TH> 
    <TH CLASS='Detail' align="center"> 
    OSH</TH> 
    <TH CLASS='Detail' align="center"> 
    AVL</TH> 
    </TR> 
    <TR > 
    <TD CLASS='Detail AVL' > 
    E1701     </TD> 
    <TD CLASS='Detail' align="center"> 
    14:16:52</TD> 
    <TD CLASS='Detail' align="center"> 
    14:23:17</TD> 
    <TD CLASS='Detail' align="center"> 
    14:30:36</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    15:17:49</TD> 
    </TR> 
    <TR > 
    <TD CLASS='Detail AVL' > 
    E1901     </TD> 
    <TD CLASS='Detail' align="center"> 
    14:16:52</TD> 
    <TD CLASS='Detail' align="center"> 
    14:20:30</TD> 
    <TD CLASS='Detail' align="center"> 
    14:27:09</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    15:20:06</TD> 
    </TR> 
    <TR > 
    <TD CLASS='Detail AVL' > 
    M241      </TD> 
    <TD CLASS='Detail' align="center"> 
    14:16:52</TD> 
    <TD CLASS='Detail' align="center"> 
    14:20:16</TD> 
    <TD CLASS='Detail' align="center"> 
    14:27:51</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    14:32:56</TD> 
    </TR> 
    <TR > 
    <TD CLASS='Detail AVL' > 
    S1704     </TD> 
    <TD CLASS='Detail' align="center"> 
    14:16:52</TD> 
    <TD CLASS='Detail' align="center"> 
    14:25:25</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    14:33:08</TD> 
    </TR> 
    <TR > 
    <TD CLASS='Detail AVL' > 
    T1702     </TD> 
    <TD CLASS='Detail' align="center"> 
    14:16:52</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    14:33:37</TD> 
    </TR> 
    <TR > 
    <TD CLASS='Detail AVL' > 
    T1705     </TD> 
    <TD CLASS='Detail' align="center"> 
    14:16:52</TD> 
    <TD CLASS='Detail' align="center"> 
    14:26:14</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    14:33:29</TD> 
    </TR> 
    <TR > 
    <TD CLASS='Detail AVL' > 
    E1501     </TD> 
    <TD CLASS='Detail' align="center"> 
    14:22:27</TD> 
    <TD CLASS='Detail' align="center"> 
    14:24:20</TD> 
    <TD CLASS='Detail' align="center"> 
    14:28:19</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    15:09:11</TD> 
    </TR> 
    <TR > 
    <TD CLASS='Detail AVL' > 
    C1515     </TD> 
    <TD CLASS='Detail' align="center"> 
    14:23:49</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    14:23:55</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    15:09:23</TD> 
    </TR> 
    <TR > 
    <TD CLASS='Detail AVL' > 
    C1716     </TD> 
    <TD CLASS='Detail' align="center"> 
    14:24:44</TD> 
    <TD CLASS='Detail' align="center"> 
    14:24:48</TD> 
    <TD CLASS='Detail' align="center"> 
    14:32:09</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    00:00:00</TD> 
    <TD CLASS='Detail' align="center"> 
    15:20:47</TD> 
    </TR> 
    </table></td></tr><tr><td colspan="4"><hr color=navy></td></tr><tr><table cellpadding="1" cellspacing="0" width="100%"><tr><th class="Detail" align="left" width=$cw>Notes</th><td class="Detail" colspan=3"><table cellpadding="1" cellspacing="0" width="100%"><TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>UNIT     TYPE  DISPATCH   RESPOND    ON-SCENE   TRANSPORT   AT HOSP.   AVAILABLE</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>-------  ----  --------   --------   --------   ---------   --------   --------</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>E1901     E    14:16:52   14:20:30   14:27:09                          15:20:06</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>E1701     E    14:16:52   14:23:17   14:30:36                          15:17:49</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>T1705     T    14:16:52   14:26:14                                     14:33:29</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>T1702     T    14:16:52                                                14:33:37</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>S1704     S    14:16:52   14:25:25                                     14:33:08</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>M241      M    14:16:52   14:20:16   14:27:51                          14:32:56</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>E1501     E    14:22:27   14:24:20   14:28:19                          15:09:11</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>C1515     C    14:23:49              14:23:55                          15:09:23</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">00:00:00 &nbsp;</td><TD CLASS='Notes' > 
    <pre>C1716     C    14:24:44   14:24:48   14:32:09                          15:20:47</pre></TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:15:05 &nbsp;</td><TD CLASS='Notes' > 
    Complainant: JEROME, Phone: 5734410736</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:15:05 &nbsp;</td><TD CLASS='Notes' > 
    Response area: 19-17B</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:15:06 &nbsp;</td><TD CLASS='Notes' > 
    *CITY: BC-BOONE COUNTY </TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:15:59 &nbsp;</td><TD CLASS='Notes' > 
    ProQAF Determinant Code: 69D6</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:15:59 &nbsp;</td><TD CLASS='Notes' > 
    ProQAF Structure Fire.  Residential</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:15:59 &nbsp;</td><TD CLASS='Notes' > 
    ProQAF (single).Caller Statement: FIRE.</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:15:59 &nbsp;</td><TD CLASS='Notes' > 
    Complainant name changed to JEROME in ProQAF</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:15:59 &nbsp;</td><TD CLASS='Notes' > 
    ProQAF Number: 0010003115</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:16:50 &nbsp;</td><TD CLASS='Notes' > 
    ProQAF (single).Caller Statement: FIRE.  6.No one</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:16:50 &nbsp;</td><TD CLASS='Notes' > 
    ProQAF is trapped inside the structure.</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:16:51 &nbsp;</td><TD CLASS='Notes' > 
    *NOTIFY CFD, CF2-WITT, CF3-MARTIN OF (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:16:51 &nbsp;</td><TD CLASS='Notes' > 
    *WORKING STRUCTURE FIRES (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:16:52 &nbsp;</td><TD CLASS='Notes' > 
    Fire service incident 201023687 (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:17:04 &nbsp;</td><TD CLASS='Notes' > 
    TAC CHANNEL BF1 ASSIGNED (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:20:12 &nbsp;</td><TD CLASS='Notes' > 
    OUT BUILDING ONFIRE (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:20:16 &nbsp;</td><TD CLASS='Notes' > 
    Unit M241 Pressed Enroute</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:21:02 &nbsp;</td><TD CLASS='Notes' > 
    !***Nature changed via ProQAF From: </TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:21:02 &nbsp;</td><TD CLASS='Notes' > 
    !69D6-RES STR FIRE</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:21:02 &nbsp;</td><TD CLASS='Notes' > 
    RCF ProQAF Determinant Code: 69D9</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:21:02 &nbsp;</td><TD CLASS='Notes' > 
    RCF ProQAF Structure Fire.  Small NON-DWELLING</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:21:02 &nbsp;</td><TD CLASS='Notes' > 
    RCF ProQAF building/structure (shed, detached</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:21:02 &nbsp;</td><TD CLASS='Notes' > 
    RCF ProQAF garage).Caller Statement: FIR.  6.No</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:21:02 &nbsp;</td><TD CLASS='Notes' > 
    RCF ProQAF one is trapped inside the structure.</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:23:28 &nbsp;</td><TD CLASS='Notes' > 
    T1705 TIMER SET TO 5 MINUTE(S) (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:23:28 &nbsp;</td><TD CLASS='Notes' > 
    T1702 TIMER SET TO 5 MINUTE(S) (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:23:29 &nbsp;</td><TD CLASS='Notes' > 
    S1704 TIMER SET TO 5 MINUTE(S) (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:23:55 &nbsp;</td><TD CLASS='Notes' > 
    C1515 went in command 14:23:55 (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:24:06 &nbsp;</td><TD CLASS='Notes' > 
    ProQAF garage).Caller Statement: FIR.  6.No one</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:24:17 &nbsp;</td><TD CLASS='Notes' > 
    *SMALL FIVE BY FIVE OUTSIDE BUILDING (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:24:17 &nbsp;</td><TD CLASS='Notes' > 
    *SMOKE SHOWING (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:27:51 &nbsp;</td><TD CLASS='Notes' > 
    Unit M241 Pressed On scene</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:28:04 &nbsp;</td><TD CLASS='Notes' > 
    Tactical channel changed from BF1 to (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:28:04 &nbsp;</td><TD CLASS='Notes' > 
    GLD (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:28:12 &nbsp;</td><TD CLASS='Notes' > 
    ALL UNITS REPORT TO GOLD (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:28:57 &nbsp;</td><TD CLASS='Notes' > 
    T1702 TIMER SET TO 5 MINUTE(S) (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:32:49 &nbsp;</td><TD CLASS='Notes' > 
    Mark Inc Under Ctrl updated from: 12/19/10 (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:32:50 &nbsp;</td><TD CLASS='Notes' > 
    14:32:48 (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:32:57 &nbsp;</td><TD CLASS='Notes' > 
    Unit M241 Pressed Available</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">14:49:22 &nbsp;</td><TD CLASS='Notes' > 
    C1515 TIMER SET TO 20 MINUTE(S) (00000174-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">15:09:21 &nbsp;</td><TD CLASS='Notes' > 
    C1515 W/ BCFPD RPRT (00000154-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">15:20:15 &nbsp;</td><TD CLASS='Notes' > 
    C1747 W/ SBCFPD RPRT (00000154-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">15:20:49 &nbsp;</td><TD CLASS='Notes' > 
    *Fire incident 201023687 closed (00000154-160)</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">15:20:49 &nbsp;</td><TD CLASS='Notes' > 
    Report written for FDID 01004 201023687-00</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">15:20:49 &nbsp;</td><TD CLASS='Notes' > 
    Report written for FDID 19011 201023687-00</TD> 
    </TR> 
    <TR > 
    <td class="Notes" valign="top" align="left">15:20:49 &nbsp;</td><TD CLASS='Notes' > 
    Report written for FDID 01001 201023687-00</TD> 
    </TR> 
    </table></td></tr></table></tr></table>			
    			</BODY>
    			</HTML>
    			<script language="javascript" src="JSFuncs.js"></script>
  }
end