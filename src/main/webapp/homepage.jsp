


<%@page import="AppLogic.myUser"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="com.googlecode.objectify.ObjectifyService"%>

<%-- 
    Document   : airlineview
    Created on : Apr 3, 2016, 5:53:19 PM
    Author     : Administrator
--%>


<!DOCTYPE HTML>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/stylesheets/w2ui-1.4.3.min.css" />
        <script src="/stylesheets/jquery-2.2.2.min.js"></script>
        <script type="text/javascript" src="/stylesheets/w2ui-1.4.3.min.js"></script>

        <title>Airline Viewer</title>
    </head>
    <body>
         <div id="toolbar"></div>
        <%
            String useremail = request.getParameter("Email");
             if (useremail == null) {
                useremail = " ";
            }
        myUser user = new myUser();
        user = ObjectifyService.ofy().load().type(myUser.class).filter("email", "hello.sah802@gmail.com").first().now();
        
            %>
        <h1> Welcome <%=user.getuserName()%> !</h1>
        
        
        
        
        
        
        
        
        
        
        
        <script>
            $('#toolbar').w2toolbar({
                name: 'toolbar',
                items: [
                    {type: 'check', id: 'item1', caption: 'Check', img: 'icon-page', checked: true},
                    {type: 'break', id: 'break0'},
                    {type: 'menu', id: 'item2', caption: 'Drop Down', img: 'icon-folder', items: [
                            {text: 'Item 1', icon: 'icon-page'},
                            {text: 'Item 2', icon: 'icon-page'},
                            {text: 'Item 3', value: 'Item Three', icon: 'icon-page'}
                        ]},
                    {type: 'break', id: 'break1'},
                    {type: 'radio', id: 'item3', group: '1', caption: 'Radio 1', icon: 'fa-star', checked: true},
                    {type: 'radio', id: 'item4', group: '1', caption: 'Radio 2', icon: 'fa-star-empty'},
                    {type: 'spacer'},
                    {type: 'button', id: 'item5', caption: 'Home', icon: 'fa-home'},
                    {type: 'button', id: 'item6', caption: 'SignUp', icon: 'fa-home'}
                ]
            });
            w2ui.toolbar.on('click', function (target, data) {
                //console.log('item ' + event.target + ' is clicked.');
                if (target == 'item6')
                {
                    window.location = "/signup.jsp";
                }
                if (target == 'item5')
                {
                    window.location = "/homepage.jsp";
                }
            });
            </script>
        
     
    </body>


</html>
