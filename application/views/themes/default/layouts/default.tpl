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
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="{base_url()}assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="{base_url()}assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="{base_url()}assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="{base_url()}assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
	{partial('header')}
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN PAGE STYLES -->
<link href="{base_url()}assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE STYLES -->
<!-- BEGIN THEME STYLES -->
<!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
<link href="{base_url()}assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="{base_url()}assets/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="{base_url()}assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css">
<link href="{base_url()}assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="{base_url()}assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico">
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER -->
<div class="page-header">
	<!-- BEGIN HEADER TOP -->
	<div class="page-header-top">
		<div class="container">
			<!-- BEGIN LOGO -->
			<div class="page-logo">
				<a href="{base_url()}"><h3>ISSUES MONITORING SYSTEM</h3></a>
			</div>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="menu-toggler"></a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN NOTIFICATION DROPDOWN -->

					{assign var="notif" value=get_notification()}

					<li class="dropdown dropdown-extended dropdown-dark dropdown-notification" id="header_notification_bar">
						<a href="javascript:;" class="notif dropdown-toggle" data-toggle="dropdown" data-close-others="true">
						<i class="icon-bell"></i>
						<span class="badge badge-default jml-notif">{$notif['total']}</span>
						</a>
						<ul class="dropdown-menu">
							<li class="external">
								<h3>You have <strong>{$notif['total']}</strong> notifications</h3>
								<a href="{base_url('notification')}">view all</a>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller list-notif" style="height: 250px;" data-handle-color="#637283">
									
									{foreach from=$notif['data'] item=n }

										{assign var="time" value=time_ago($n->timestamp)}

										<li>
											<a href="javascript:;">
												<span class="time">{$time}</span>
												<span class="details">
													Issue {$n->subject} status: <strong>{$n->type}</strong> 
												</span>
											</a>
										</li>

									{/foreach}

								</ul>
							</li>
						</ul>
					</li>
					<!-- END NOTIFICATION DROPDOWN -->
					<li class="droddown dropdown-separator">
						<span class="separator"></span>
					</li>
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown dropdown-user dropdown-dark">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<img alt="" class="img-circle" src="{base_url()}assets/admin/layout/img/avatar.png">
						<span class="username username-hide-mobile">Administrator</span>
						</a>
						<ul class="dropdown-menu dropdown-menu-default">
							<li>
								<a href="extra_profile.html">
								<i class="icon-user"></i> Profile </a>
							</li>
							<li>
								<a href="login.html">
								<i class="icon-key"></i> Log Out </a>
							</li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
	</div>
	<!-- END HEADER TOP -->
	<!-- BEGIN HEADER MENU -->
	<div class="page-header-menu">
		<div class="container">
			<!-- BEGIN MEGA MENU -->
			<!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background -->
			<!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the dropdown opening on mouse hover -->
			<div class="hor-menu ">
				<ul class="nav navbar-nav menu">
					<li class="menu-dropdown classic-menu-dropdown ">
						<a data-hover="megamenu-dropdown" data-close-others="true" data-toggle="dropdown" href="javascript:;">
						Master <i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu pull-left">
							<li class="">
								<a href="{base_url('staff/administrator')}">
									<i class="fa fa-cog"></i> Administrator
								</a>
							</li>
							<li class="">
								<a href="{base_url('staff')}">
									<i class="fa fa-wrench"></i> Technician
								</a>
							</li>
							<li class="">
								<a href="{base_url('outlet')}">
									<i class="fa fa-institution"></i> Outlet
								</a>
							</li>
						</ul>
					</li>
					<li class="">
						<a data-hover="megamenu-dropdown" data-close-others="true" data-toggle="dropdown" href="javascript:;">
							Ticket <i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu pull-left">
							<li class="dropdown-submenu">
								<a href="javascript:;">
									<i class="fa fa-list"></i> List 
								</a>
								<ul class="dropdown-menu">
									<li class=" ">
										<a href="{base_url('issue/open')}">Open</a>
									</li>
									<li class=" ">
										<a href="{base_url('issue/pending')}">Pending</a>
									</li>
									<li class=" ">
										<a href="{base_url('issue/progress')}">In Progress</a>
									</li>
									<li class=" ">
										<a href="{base_url('issue/solved')}">Solved</a>
									</li>
									<li class=" ">
										<a href="{base_url('issue')}">All</a>
									</li>
								</ul>
							</li>
							<li class="">
								<a href="{base_url('issue/add')}">
									<i class="fa fa-institution"></i> Open Ticket
								</a>
							</li>
						</ul>
					</li>
					<li class="">
						<a href="report.html">
							Report
						</a>
					</li>
				</ul>
			</div>
			<!-- END MEGA MENU -->
		</div>
	</div>
	<!-- END HEADER MENU -->
</div>
<!-- END HEADER -->
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container">
	<!-- BEGIN PAGE HEAD -->
	<div class="page-head">
		
	</div>
	<!-- END PAGE HEAD -->
	<!-- BEGIN PAGE CONTENT -->
	<div class="page-content">
		<div class="container">

			<!-- BEGIN ALERT -->
			<div id="alert-cont">
				{$alert}
			</div>
			<!-- END ALERT -->

			{partial('content')}

		</div>

	</div>
	<!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->

<!-- BEGIN FOOTER -->
<div class="page-footer">
	<div class="container">
		 2016 &copy; Issues Monitoring System
	</div>
</div>
<div class="scroll-to-top">
	<i class="icon-arrow-up"></i>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="{base_url()}assets/global/plugins/respond.min.js"></script>
<script src="{base_url()}assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="{base_url()}assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="{base_url()}assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<script type="text/javascript">
	var base_url = "{base_url()}";

	{literal}
    $(document).ready(function(){

        var url = window.location.href;
        $('ul.menu li').each(function(){
                if($(this).hasClass('active'))
                {
                    $(this).removeClass('active');
                    //alert('tes');
                }
        });


        var link = $('ul.nav li a').filter(function() {return this.href == url;});
        if(link.parent().parent().hasClass('dropdown-menu'))
        {
            link.parent().addClass('active');
            link.parent().parent().parent().addClass('active');
        }
        else
        {
            link.parent().addClass('active');
        }

        $('a.notif').click( function() {        	
        	
        	var url = base_url+'notification/read';

        	$.get( url, function( result ) {

        		result = JSON.parse(result);

        		if( result.status)
        		{	
        			$('span.jml-notif').html('0');
        		}

			});
			
        });



    });
	{/literal}
</script>

{partial('footer')}

</body>
<!-- END BODY -->
</html>