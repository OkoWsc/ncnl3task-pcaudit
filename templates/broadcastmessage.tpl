{config_load file='config.conf'}

<!DOCTYPE html> <html lang="en"> <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>{$title} {#appname#}</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/chart.js"></script>

    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--> </head> <body>
    {include file='header.tpl'}
    </header>
    <script>
    function broadcastmessage() {
       message={};
       message['title'] = document.getElementById('title').value;
       message['message'] = document.getElementById('message').value;
       message['type'] = document.getElementById('type').value;
       pubnub.publish({
               channel: 'broadcastmessage',
               message: message
               })


      console.log("error",title,message,type);
    }
    </script>


    <!-- Page Content -->
    <div class="container">
        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Welcome to {#appname#}
                </h1>
                <h3>Message broadcast</h3>
                <p>This will broadcast a message to all users</p>
		<p>To reset(aka stop it keep popping up), send a message but leave the title and content field blank.</p>
            </div>

<div class="row">
        <form method="GET">
        <input type="text" placeholder="Message Title" id="title" name="title"><br />
        <input type="text" placeholder="Message content" id="message" name="message"><br />
        <select id="type" name="type">
          <option value="info">Info</option>
          <option value="success">Success</option>
          <option value="warning">Warning</option>
          <option value="error">Error</option>
        </select><br />
        <button type="button" onclick="broadcastmessage();">Broadcast Message</button>
        </form>
        </div>
        <!-- /.row -->
        <hr>
        <!-- Footer -->
        {include file='footer.tpl'}
    </div>
    <!-- /.container -->
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body> </html>

