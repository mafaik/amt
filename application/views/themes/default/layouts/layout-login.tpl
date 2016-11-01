<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<title>{$title}</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
<link href="{base_url()}assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="{base_url()}assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="{base_url()}assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="{base_url()}assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="{base_url()}assets/admin/pages/css/login2.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="{base_url()}assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="{base_url()}assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="{base_url()}assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="{base_url()}assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="{base_url()}assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGO -->
<div class="logo">
	<a href="index.html">
	<h3>ADMIN LOGIN</h3>
	</a>
</div>
<!-- END LOGO -->

{partial('content')}

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="{base_url()}assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="{base_url()}assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<script type="text/javascript">
	var base_url = "{base_url()}"; 
</script>

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="{base_url()}assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/pages/scripts/login.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Login.init();
	Demo.init();
});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>



