

<%-- 
    Document   : signup
    Created on : Apr 3, 2016, 6:53:33 PM
    Author     : Administrator
--%>

<%@page import="DBHandler.DataStoreFunctions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/stylesheets/w2ui-1.4.3.min.css" />
        <script src="/stylesheets/jquery-2.2.2.min.js"></script>
        <script type="text/javascript" src="/stylesheets/w2ui-1.4.3.min.js"></script>
        <title>SignUp Form</title>
    </head>

    <body>
        <div id="toolbar"></div>
        <form action="/sign" method="post">
            Full Name: <input type="text" name="Name" value="" />
            <div> </div>
            Password: <input type="password" name="Password" value="" />
            <div> </div>
            Email:  <input type="text" name="Email" value="" />
            <div> </div>
            Age: <input type="text" name="Age" value="" />
            <div> </div>
            Gender: 
            Male<input type="radio" name="Gender" value="Male" />
            <div> </div>
            Female<input type="radio" name="Gender" value="Female" />
            <div> </div>
            Country: <select name="Country">
                <option>UAE</option>
                <option>Qatar</option>
                <option>Bahrain</option>
                <option>KSA</option>
                <option>Kuwait</option>
            </select>
            <div> </div>
            <input type="submit" value="Signup" />

        </form>









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
