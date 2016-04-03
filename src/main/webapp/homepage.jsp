
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
        <h1> Welcome to SkyAssistant! </h1>
        <div id="myGrid" style="height: 450px"></div>
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
          
            <script>
                $('#myGrid').w2grid({
                    name: 'myGrid',
                    columns: [
                        {field: 'fname', caption: 'Airline', size: '30%'},
                        {field: 'lname', caption: 'Destination', size: '30%'},
                        {field: 'email', caption: 'Flight', size: '40%'},
                        {field: 'sdate', caption: 'Date', size: '120px'},
                    ],
                    records: [
                        {recid: 1, fname: 'Emirates Airlines', lname: 'Berlin', email: '#4545', sdate: '4/3/2017'},
                        {recid: 2, fname: 'Emirates Airlines', lname: 'London', email: '#6677', sdate: '4/3/2017'},
                        {recid: 3, fname: 'Air Canada', lname: 'Ontario', email: '#3344', sdate: '4/3/2017'}
                        
                    ]
                });
            </script>
    </body>


</html>
