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
  end
  
  
  
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
        <script type="text/javascript">//&lt;![CDATA[
        //----------------------------------------------------------------------------
        // Code to determine the browser and version.
        //----------------------------------------------------------------------------

        function Browser() {
          var ua, s, i;
          this.isIE    = false;  // Internet Explorer
          this.isOP    = false;  // Opera
          this.isNS    = false;  // Netscape
          this.version = null;
          ua = navigator.userAgent;
          s = "Opera";
          if ((i = ua.indexOf(s)) &gt;= 0) {
            this.isOP = true;
            this.version = parseFloat(ua.substr(i + s.length));
            return;
          }
          s = "Netscape6/";
          if ((i = ua.indexOf(s)) &gt;= 0) {
            this.isNS = true;
            this.version = parseFloat(ua.substr(i + s.length));
            return;
          }

          // Treat any other "Gecko" browser as Netscape 6.1.
          s = "Gecko";
          if ((i = ua.indexOf(s)) &gt;= 0) {
            this.isNS = true;
            this.version = 6.1;
            return;
          }

          s = "MSIE";
          if ((i = ua.indexOf(s))) {
            this.isIE = true;
            this.version = parseFloat(ua.substr(i + s.length));
            return;
          }
        }

        var browser = new Browser();

        //----------------------------------------------------------------------------
        // Code for handling the menu bar and active button.
        //----------------------------------------------------------------------------
        var activeButton = null;

        // Capture mouse clicks on the page so any active button can be
        // deactivated.
        if (browser.isIE)
          document.onmousedown = pageMousedown;
        else
          document.addEventListener("mousedown", pageMousedown, true);

        function pageMousedown(event) {
          var el;

          // If there is no active button, exit.
          if (activeButton == null)
            return;

          // Find the element that was clicked on.
          if (browser.isIE)
            el = window.event.srcElement;
          else
            el = (event.target.tagName ? event.target : event.target.parentNode);

          // If the active button was clicked on, exit.
          if (el == activeButton)
            return;

          // If the element is not part of a menu, reset and clear the active
          // button.
          if (getContainerWith(el, "DIV", "menu") == null) {
            resetButton(activeButton);
            activeButton = null;
          }
        }


        function buttonClick(event, menuId) {
          var button;

          // Get the target button element.
          if (browser.isIE)
            button = window.event.srcElement;
          else
            button = event.currentTarget;

          // Blur focus from the link to remove that annoying outline.
          button.blur();

          // Associate the named menu to this button if not already done.
          // Additionally, initialize menu display.
          if (button.menu == null) {
            button.menu = document.getElementById(menuId);
            if (button.menu.isInitialized == null)
              menuInit(button.menu);
          }

          // Set mouseout event handler for the button, if not already done.
          if (button.onmouseout == null)
            button.onmouseout = buttonOrMenuMouseout;

          // Exit if this button is the currently active one.
          if (button == activeButton)
            return false;

          // Reset the currently active button, if any.
          if (activeButton != null)
            resetButton(activeButton);

          // Activate this button, unless it was the currently active one.
          if (button != activeButton) {
            depressButton(button);
            activeButton = button;
          }
          else
            activeButton = null;

          return false;
        }

        function buttonMouseover(event, menuId) {

          var button;

          if (activeButton == null) {
            buttonClick(event, menuId);
            return;
          }

          // Find the target button element.
          if (browser.isIE)
            button = window.event.srcElement;
          else
            button = event.currentTarget;

          // If any other button menu is active, make this one active instead.
          if (activeButton != null &amp;&amp; activeButton != button)
            buttonClick(event, menuId);
        }

        function depressButton(button) {
          var x, y;

          // Update the button's style class to make it look like it's
          // depressed.
          button.className += " menuButtonActive";

          // Set mouseout event handler for the button, if not already done.
          if (button.onmouseout == null)
            button.onmouseout = buttonOrMenuMouseout;
          if (button.menu.onmouseout == null)
            button.menu.onmouseout = buttonOrMenuMouseout;

          // Position the associated drop down menu under the button and
          // show it.
          x = getPageOffsetLeft(button);
          y = getPageOffsetTop(button) + button.offsetHeight;

          // For IE, adjust position.
          if (browser.isIE) {
            x += button.offsetParent.clientLeft-5;
            y += button.offsetParent.clientTop+3;
          }

          button.menu.style.left = x + "px";
          button.menu.style.top  = y + "px";
          button.menu.style.visibility = "visible";

          // For IE; size, position and show the menu's IFRAME as well.
          if (button.menu.iframeEl != null)
          {
            button.menu.iframeEl.style.left = button.menu.style.left;
            button.menu.iframeEl.style.top  = button.menu.style.top;
            button.menu.iframeEl.style.width  = button.menu.offsetWidth + "px";
            button.menu.iframeEl.style.height = button.menu.offsetHeight + "px";
            button.menu.iframeEl.style.display = "";
          }
        }

        function resetButton(button) {

          // Restore the button's style class.
          removeClassName(button, "menuButtonActive");

          // Hide the button's menu, first closing any sub menus.
          if (button.menu != null) {
            closeSubMenu(button.menu);
            button.menu.style.visibility = "hidden";

            // For IE, hide menu's IFRAME as well.
            if (button.menu.iframeEl != null)
              button.menu.iframeEl.style.display = "none";
          }
        }

        //----------------------------------------------------------------------------
        // Code to handle the menus and sub menus.
        //----------------------------------------------------------------------------

        function menuMouseover(event) {

          var menu;

          // Find the target menu element.

          if (browser.isIE)
            menu = getContainerWith(window.event.srcElement, "DIV", "menu");
          else
            menu = event.currentTarget;

          // Close any active sub menu.

          if (menu.activeItem != null)
            closeSubMenu(menu);
        }

        function menuItemMouseover(event, menuId) {
          var item, menu, x, y;

          // Find the target item element and its parent menu element.
          if (browser.isIE)
            item = getContainerWith(window.event.srcElement, "A", "menuItem");
          else
            item = event.currentTarget;
          menu = getContainerWith(item, "DIV", "menu");

          // Close any active sub menu and mark this one as active.
          if (menu.activeItem != null)
            closeSubMenu(menu);
          menu.activeItem = item;

          // Highlight the item element.
          item.className += " menuItemHighlight";

          // Initialize the sub menu, if not already done.
          if (item.subMenu == null) {
            item.subMenu = document.getElementById(menuId);
            if (item.subMenu.isInitialized == null)
              menuInit(item.subMenu);
          }

          // Set mouseout event handler for the sub menu, if not already done.
          if (item.subMenu.onmouseout == null)
            item.subMenu.onmouseout = buttonOrMenuMouseout;

          // Get position for submenu based on the menu item.
          x = getPageOffsetLeft(item) + item.offsetWidth;
          y = getPageOffsetTop(item);

          // Adjust position to fit in view.
          var maxX, maxY;
          if (browser.isIE) {
            maxX = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft) +
              (document.documentElement.clientWidth != 0 ? document.documentElement.clientWidth : document.body.clientWidth);
            maxY = Math.max(document.documentElement.scrollTop, document.body.scrollTop) +
              (document.documentElement.clientHeight != 0 ? document.documentElement.clientHeight : document.body.clientHeight);
          }
          if (browser.isOP) {
            maxX = document.documentElement.scrollLeft + window.innerWidth;
            maxY = document.documentElement.scrollTop  + window.innerHeight;
          }
          if (browser.isNS) {
            maxX = window.scrollX + window.innerWidth;
            maxY = window.scrollY + window.innerHeight;
          }
          maxX -= item.subMenu.offsetWidth;
          maxY -= item.subMenu.offsetHeight;

          if (x &gt; maxX)
            x = Math.max(0, x - item.offsetWidth - item.subMenu.offsetWidth
              + (menu.offsetWidth - item.offsetWidth));
          y = Math.max(0, Math.min(y, maxY));

          // Position and show the sub menu.
          item.subMenu.style.left       = x + "px";
          item.subMenu.style.top        = y + "px";
          item.subMenu.style.visibility = "visible";

          // For IE; size, position and display the menu's IFRAME as well.
          if (item.subMenu.iframeEl != null)
          {
            item.subMenu.iframeEl.style.left    = item.subMenu.style.left;
            item.subMenu.iframeEl.style.top     = item.subMenu.style.top;
            item.subMenu.iframeEl.style.width   = item.subMenu.offsetWidth + "px";
            item.subMenu.iframeEl.style.height  = item.subMenu.offsetHeight + "px";
            item.subMenu.iframeEl.style.display = "";
          }

          // Stop the event from bubbling.
          if (browser.isIE)
            window.event.cancelBubble = true;
          else
            event.stopPropagation();
        }

        function closeSubMenu(menu) {
          if (menu == null || menu.activeItem == null)
            return;

          // Recursively close any sub menus.
          if (menu.activeItem.subMenu != null) {
            closeSubMenu(menu.activeItem.subMenu);
            menu.activeItem.subMenu.style.visibility = "hidden";

            // For IE, hide the sub menu's IFRAME as well.
            if (menu.activeItem.subMenu.iframeEl != null)
              menu.activeItem.subMenu.iframeEl.style.display = "none";

            menu.activeItem.subMenu = null;
          }

          // Deactivate the active menu item.
          removeClassName(menu.activeItem, "menuItemHighlight");
          menu.activeItem = null;
        }

        // event on buttons and menus.
        function buttonOrMenuMouseout(event) {
          var el;

          // If there is no active button, exit.
          if (activeButton == null)
            return;

          // Find the element the mouse is moving to.
          if (browser.isIE)
            el = window.event.toElement;
          else if (event.relatedTarget != null)
              el = (event.relatedTarget.tagName ? event.relatedTarget : event.relatedTarget.parentNode);

          // If the element is not part of a menu, reset the active button.
          if (getContainerWith(el, "DIV", "menu") == null) {
            resetButton(activeButton);
            activeButton = null;
          }
        }

        //----------------------------------------------------------------------------
        // Code to initialize menus.
        //----------------------------------------------------------------------------
        function menuInit(menu) {
          var itemList, spanList;
          var textEl, arrowEl;
          var itemWidth;
          var w, dw;
          var i, j;

          // For IE, replace arrow characters.
          if (browser.isIE) {
            menu.style.lineHeight = "2.5ex";
            spanList = menu.getElementsByTagName("SPAN");
            for (i = 0; i &lt; spanList.length; i++)
              if (hasClassName(spanList[i], "menuItemArrow")) {
                spanList[i].style.fontFamily = "Webdings";
                spanList[i].firstChild.nodeValue = "4";
              }
          }

          // Find the width of a menu item.
          itemList = menu.getElementsByTagName("A");
          if (itemList.length &gt; 0)
            itemWidth = itemList[0].offsetWidth;
          else
            return;

          // For items with arrows, add padding to item text to make the
          // arrows flush right.
          for (i = 0; i &lt; itemList.length; i++) {
            spanList = itemList[i].getElementsByTagName("SPAN");
            textEl  = null;
            arrowEl = null;
            for (j = 0; j &lt; spanList.length; j++) {
              if (hasClassName(spanList[j], "menuItemText"))
                textEl = spanList[j];
              if (hasClassName(spanList[j], "menuItemArrow"))
                arrowEl = spanList[j];
            }
            if (textEl != null &amp;&amp; arrowEl != null) {
              textEl.style.paddingRight = (itemWidth 
                - (textEl.offsetWidth + arrowEl.offsetWidth)) + "px";
              // For Opera, remove the negative right margin to fix a display bug.
              if (browser.isOP)
                arrowEl.style.marginRight = "0px";
            }
          }

          // Fix IE hover problem by setting an explicit width on first item of
          // the menu.
          if (browser.isIE) {
            w = itemList[0].offsetWidth;
            itemList[0].style.width = w + "px";
            dw = itemList[0].offsetWidth - w;
            w -= dw;
            itemList[0].style.width = w + "px";
          }

          // Fix the IE display problem (SELECT elements and other windowed controls
          // overlaying the menu) by adding an IFRAME under the menu.
          if (browser.isIE) {
            var iframeEl = document.createElement("IFRAME");
            iframeEl.frameBorder = 0;
            iframeEl.src = "javascript:;";
            iframeEl.style.display = "none";
            iframeEl.style.position = "absolute";
            //iframeEl.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)";
            menu.iframeEl = menu.parentNode.insertBefore(iframeEl, menu);
          }

          // Mark menu as initialized.
          menu.isInitialized = true;
        }

        //----------------------------------------------------------------------------
        // General utility functions.
        //----------------------------------------------------------------------------
        function getContainerWith(node, tagName, className) {
          // Starting with the given node, find the nearest containing element
          // with the specified tag name and style class.
          while (node != null) {
            if (node.tagName != null &amp;&amp; node.tagName == tagName &amp;&amp;
                hasClassName(node, className))
              return node;
            node = node.parentNode;
          }
          return node;
        }

        function hasClassName(el, name) {
          var i, list;
          // Return true if the given element currently has the given class
          // name.
          list = el.className.split(" ");
          for (i = 0; i &lt; list.length; i++)
            if (list[i] == name)
              return true;
          return false;
        }

        function removeClassName(el, name) {
          var i, curList, newList;
          if (el.className == null)
            return;

          // Remove the given class name from the element's className property.
          newList = new Array();
          curList = el.className.split(" ");
          for (i = 0; i &lt; curList.length; i++)
            if (curList[i] != name)
              newList.push(curList[i]);
          el.className = newList.join(" ");
        }

        function getPageOffsetLeft(el) {
          var x;
          // Return the x coordinate of an element relative to the page.
          x = el.offsetLeft;
          if (el.offsetParent != null)
            x += getPageOffsetLeft(el.offsetParent);
          return x;
        }

        function getPageOffsetTop(el) {
          var y;
          // Return the x coordinate of an element relative to the page.
          y = el.offsetTop;
          if (el.offsetParent != null)
            y += getPageOffsetTop(el.offsetParent);
          return y;
        }
        //]]&gt;</script>
        <style type="text/css">

        div.menuBar,
        div.menuBar a.menuButton,
        div.menu,
        div.menu a.menuItem {
          font-family: Arial, "MS Sans Serif", sans-serif;
          font-size: 10pt;
          font-style: normal;
          font-weight: normal;
          color: #0066cc;
          text-align: left;
        }

        div.menuBar {
          background-color: #0066cc;
          /*border: 2px outset #e0e0e0;*/
          border: 0px;
          border: 2px solid;
          border-color: #0066cc #0066cc #0066cc #0066cc;
          padding: 4px 2px 4px 2px;
          text-align: left;
          top: 0px;
          left: 0px;
        }

        div.menuBar a.menuButton {
          background-color: transparent;
          border: 1px solid #0066cc;
          color: #ffffff;
          cursor: default;
          left: 0px;
          margin: 1px;
          padding: 2px 6px 2px 6px;
          position: relative;
          text-decoration: none;
          text-align: left;
          top: 0px;
          z-index: 100;
        }
        div.menuBar a.menuLink {
        	background-color: transparent;
        	font-family: Arial, "MS Sans Serif", sans-serif;
        	font-size: 10pt;
        	font-style: normal;
        	font-weight: normal;
        	color: #ffffff;
        	text-align: right;
        	text-decoration: none;
        	margin: 1px;
        	padding: 2px 6px 2px 6px;	
        	/*width: 150px;*/
        }

        div.menuBar a.menuLink:hover {
        	background-color: 000080;
        	border: 1px outset #e0e0e0;
        	text-align:left;
        	color: #ffffff;
        	cursor: default;
        }

        div.menuBar a.menuButton:hover {
          background-color: 000080;
          border: 1px outset #e0e0e0;
          text-align:left;
          color: #ffffff;
        }

        div.menuBar a.menuButtonActive,
        div.menuBar a.menuButtonActive:hover {
          background-color: #0066cc;
          /*border: 1px inset #e0e0e0;*/
          color: #ffffff;
          /*left: 1px;*/
          /*top: 1px;*/
          text-align: left;
        }

        div.menu {
          background-color: #0066cc;
          /*border: 2px outset #e0e0e0;*/
          left: 0px;
          padding: 0px 1px 1px 0px;
          position: absolute;
          top: 28px;
          visibility: hidden;
          z-index: 101;
          text-align: left;
        }

        div.menu a.menuItem {
          color: #ffffff;
          cursor: default;
          display: block;
          padding: 3px 1em;
          text-decoration: none;
          text-align: left;
          white-space: nowrap;
        }

        div.menu a.menuItem:hover, div.menu a.menuItemHighlight {
          background-color: #000080;
          color: #ffffff;
          text-align: left;
        }

        div.menu a.menuItem span.menuItemText {}

        div.menu a.menuItem span.menuItemArrow {
          margin-right: -.75em;
        }

        div.menu div.menuItemSep {
          border: 1px inset #e0e0e0;
          margin: 4px 2px;
        }
        </style>

        <meta content="text/html; charset=windows-1252" http-equiv="Content-Type"><meta content="NO-CACHE" http-equiv="PRAGMA"><meta content="0" http-equiv="EXPIRES"><title>EnRoute I-STATUS</title></head><body onload="ClearSortCookie(); SendRequest();" onunload="ClearTimer()"><div style="position: relative;" class="menuBar"><a onmouseover="buttonMouseover(event, 'FireMenu');" class="menuButton">Fire</a><a onmouseover="buttonMouseover(event, 'AdminMenu');" class="menuButton">Admin</a><a target="_top" href="UserLogin.php" onclick="LogOffClicked(&quot;UserKey&quot;)" class="menuButton">Logoff</a><span style="width: 150px;">&nbsp;</span><a href="#" onclick="ToggleMode()" onmouseover="" class="menuLink">Night Mode</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<img style="position: absolute; top: -3px;" src="I-STATUS1.gif"></div><div onmouseover="menuMouseover(event)" class="menu" id="AmbMenu"></div><div onmouseover="menuMouseover(event)" class="menu" id="FireMenu"><a target="Top" href="Dispatch_center.php" class="menuItem">Active Fire/EMS Calls</a> <a target="Top" href="TruckStatus.php" class="menuItem">Apparatus</a> <a target="Top" href="SearchDStats.php" class="menuItem">Fire/EMS History</a> <a target="Top" href="ChgQuarters.php" class="menuItem">Coverage/Quarters</a> <a target="Top" href="FireRestricts.php" class="menuItem">Restrictions</a> </div><div onmouseover="menuMouseover(event)" class="menu" id="PoliceMenu"></div><div onmouseover="menuMouseover(event)" class="menu" id="AdminMenu"><a target="Top" href="UserPasswordMaint.php" class="menuItem">Change Password</a></div><script language="javascript">
        function popup(URL) {
        	opts="'toolbar=0, scrollbars=0, location=0, menubar=0, resizable=0, width=160,"
        	opts=opts + "height=200, top=60, left=60'"
        	mywindow=window.open(URL, "newwin",opts);
        	if (mywindow.opener == null)
        		mywindow.opener=self;
        }
        function LogOffClicked(CN)
        {
        	var cookiename=CN;
        	/*alert("logoff clicked= " + cookiename);	
        	if (isset($_COOKIE['cookiename'])){
        		alert("Cookie is set");
        		setcookie ("cookiename", "", time()-60*60*24*100);
        	}*/
        	DeleteCookie(cookiename);
        }
        function ToggleMode() {
        	var cname="NiteMode";
        	var mode=ReadCookie(cname); 
        	if (mode == "") mode="Day";
        	if (mode == "Day") {
        		var newmode="Nite";
        	} else {
        		var newmode="Day";
        	}
        	WriteCookie(cname,newmode,1);
        	if (window.parent.frames.length == 0) {
        		window.self.location.href=window.self.location.href;
        	} else {
        		for (i=0; i&lt;window.parent.frames.length; i++)
        			window.parent.frames(i).location.href=window.parent.frames(i).location.href;
        	}
        }
        </script>
        <script src="JSFuncs.js" language="JavaScript"></script><script language="javascript">
        /// Function to return the value of a given cookie
        function cookieVal(cookieName){
        	thisCookie=document.cookie.split("; ");
        	var rtnval="";
        	for (i=0; i&lt;thisCookie.length; i++){
        		if (cookieName == thisCookie[i].split("=")[0]){
        			rtnval=thisCookie[i].split("=")[1];
        		}
        	}
        	return rtnval;
        }
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
        window.onresize = SetDivSize;
        var instr;
        var fdtacs=cookieVal("FDTacs");
        var fdids=cookieVal("FDIDs");
        var fdgrids=cookieVal("FDGrids");
        var fdnats=cookieVal("FDNats");
        var fddsps=cookieVal("FDDsps");

        function SetDivSize(){
           //center Scrollable2
           var obj=document.getElementById("Scrollable2");
           obj.style.left=(document.body.clientWidth-540)/2;

        	ht=document.body.clientHeight-d.offsetTop;
        	d.style.height=ht-60;
        }

        function TruckScreen(scrn){
        	WriteCookie("TScreen",scrn,"1");
        	SendRequest()
        }
        // Create a request for data
        function CreateRequest(){
        	try {
        		request=new XMLHttpRequest();
        	} catch (trymicrosoft) {
        		try {
        			request = new ActiveXObject("Msxml2.XMLHTTP");
        		} catch (othermicrosoft) {
        			try {
        				request=new ActiveXObject("Microsoft.XMLHTTP");
        			} catch (failed) {
        				request=null;
        			}
        		}
        	}
        	if (request == null) alert("Error creating request object!");
        }

        // Send request for data to server
        function SendRequest(){
        	CreateRequest();
        	if (request != null){
        		var url="AjaxTS2.php";
        		request.open("GET",url,true);
        		request.setRequestHeader("Content-Type","text/xml");
        		request.onreadystatechange=UpdatePage;
        		request.send(null);
        	}
        	RefreshTimer();
        }

        // Update page with returned data
        function UpdatePage(){
        	rrs=request.readyState;
        	if (rrs == 4){
        		instr=request.responseText;
        		// If the instr contains "UserLogin.php", which means
        		// the page has timed out (code is in Global.php).
        		if (instr.indexOf("UserLogin.php") != -1) {
        		   top.location="UserLogin.php";
        		}
        		BuildTable();
        	}
        }

        function BuildTable(){
        	var lctr;
        	var outstr = new StringBuffer();
        	var usort;
        	var leftMargin;
        	usort=cookieVal("TScreen");
        	if (usort == "") usort=1;	

        	// Calculate left margin in order to center Scrollable2
        	leftMargin=(document.body.clientWidth-540)/2;
        	outstr.append('&lt;div id="Scrollable2" style="position:absolute; left:'+leftMargin+'px;"&gt;');
        	outstr.append(instr);
        	outstr.append('&lt;/div&gt;');
        	h=document.getElementById("shead");
        	h.innerHTML="Apparatus Status - Screen "+usort;
        	d=document.getElementById("Scrollable");
        	d.innerHTML=outstr;	
        	ht=document.body.clientHeight-d.offsetTop;
        	d.style.height=ht-60;

        }

        function ClearSortCookie(){
        	WriteCookie("SortFlg","xx","7");
        }
        // This function expand or collapse the unit legends
        function DisplayLegends(id){
        	var ih="";
        	var cname="";
        	var ft="";
        	var fd="";
        	var fg="";
        	var fn="";
              var dp="";

        	switch (id){
        		case "legend":
        			ih="&lt;small&gt;"+"&lt;big&gt;-&lt;/big&gt; &lt;font color=#0066cc&gt;Primary&lt;/font&gt; &amp;nbsp; &amp;nbsp; "
        			  +"&lt;big&gt;*&lt;/big&gt; &lt;font color=#0066cc&gt;Two person&lt;/font&gt; &amp;nbsp; &amp;nbsp; "
        			  +"+ &lt;font color=#0066cc&gt;Primary and Two person&lt;/font&gt; &amp;nbsp; &amp;nbsp; "
        			  +"&lt;b&gt;m&lt;/b&gt; &lt;font color=#0066cc&gt;MDT&lt;/font&gt;"
        			  +"&lt;/small&gt;";
        		  cname="UnitLegends";
        		  break;
        		case "restricts":
        			ih="&lt;small&gt;&lt;font color=#FF0000&gt;";
        			if (ft != ""){
        				ih = ih + "Tacs: " + ft + "&lt;BR&gt;";
        			}
        			if (fd != ""){
        				ih=ih + "FDIDs: "+fd + "&lt;BR&gt;";
        			}
        			if (fg != ""){
        				ih=ih + "Grids: "+ fg + "&lt;BR&gt;";
        			}
        			if (fn != ""){
        				ih=ih + "Natures: "+ fn + "&lt;BR&gt;";
        			}
        			if (dp != ""){
        				ih=ih + "Dispatch: "+ dp + "&lt;BR&gt;";
        			}
        			ih=ih+"&lt;/font&gt;&lt;/small&gt;";
        			cname="FDRestrictions";
        			break;
        		default:
        			ih="";
        			cname="";
        	}
        	if (ih != ""){
        		if (document.getElementById(id).innerHTML == "") {
        			document.getElementById(id).innerHTML=ih;
        			WriteCookie(cname,"1",1);
        		} else {
        			document.getElementById(id).innerHTML="";
        			WriteCookie(cname,"0",1);
        		}
        	}
        }	
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
    </tr><tr><TH CLASS='Detail' align=left width=100px> 
    Nature</TH> 
    <TD CLASS='Detail' COLSPAN=3> 
    69D9-SML NON DWEL STR FIRE</TD> 
    </tr><tr><TH CLASS='Detail' align=left width=100px> 
    Priority</TH> 
    <TD CLASS='Detail' width=110px> 
    2</TD> 
    <TH CLASS='Detail' align=left width=100px> 
    Dispatch Code</TH> 
    <TD CLASS='Detail' > 
    BOX  </TD> 
    </tr><tr><TH CLASS='Detail' align=left> 
    Grid</TH> 
    <TD CLASS='Detail' width=110px> 
    34123B    </TD> 
    <TH CLASS='Detail' align=left width=100px> 
    Map</TH> 
    <TD CLASS='Detail' > 
              </TD> 
    </tr><tr><TH CLASS='Detail' align=left> 
    Fire Area</TH> 
    <td class="Detail" COLSPAN="3">19-17B  </td></tr><tr><TH CLASS='Detail' align=left> 
    Cross1</TH> 
    <td class="Detail" COLSPAN="3">RANGELINE RD S</td></tr><tr><TH CLASS='Detail' align=left> 
    Cross2</TH> 
    <td class="Detail" COLSPAN="3">HIGHWAY 63 S SB</td></tr><tr><th class="Detail" align="left">Hyd1</th><td class="Detail" width=$dw></td><th class="Detail" align="left" width=$cw>Hyd2</th><td class="Detail"></td></tr><tr><td colspan="4"><hr color=navy></td></tr><tr><TH CLASS='Detail' align=left width=100px> 
    Complainant</TH> 
    <TD CLASS='Detail' colspan=3> 
    JEROME</TD> 
    </tr><tr><TH CLASS='Detail' align=left width=100px> 
    Callback</TH> 
    <TD CLASS='Detail' colspan=3> 
    5734410736</TD> 
    </tr><tr><th class="Detail" align="left" width=$cw>Dispatcher</th><td class="Detail" width=$dw>AMS  </td><th class="Detail" align="left" width=$cw>CallTaker</th><td class="Detail">ALL  </td></tr><tr><TH CLASS='Detail' align=left width=100px> 
    DispO</TH> 
    <TD CLASS='Detail' > 
    ND</TD> 
    <TH CLASS='Detail' align=left width=100px> 
    Meth. Alarm</TH> 
    <TD CLASS='Detail' > 
    2         </TD> 
    </tr><tr><td colspan="4"><hr color=navy></td></tr><tr><TH CLASS='Detail' align=left width=100px> 
    Inc Date/Time</TH> 
    <TD CLASS='Detail' colspan=3> 
    12/19/2010 14:15:05</TD> 
    </tr><tr><TH CLASS='Detail' align=left width=100px> 
    On Scene</TH> 
    <TD CLASS='Detail' colspan=3> 
    12/19/2010 14:27:09</TD> 
    </tr><tr><TH CLASS='Detail' align=left width=100px> 
    Upgrade</TH> 
    <TD CLASS='Detail' colspan=3> 
    00:00:00</TD> 
    </tr><tr><TH CLASS='Detail' align=left width=100px> 
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