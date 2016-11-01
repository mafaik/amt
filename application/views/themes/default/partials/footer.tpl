<!-- BEGIN PAGE LEVEL PLUGINS -->
	
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="{base_url()}assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/pages/scripts/index3.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
   Demo.init(); // init demo(theme settings page)
   QuickSidebar.init(); // init quick sidebar
   Index.init(); // init index page
   Tasks.initDashboardWidget(); // init tash dashboard widget
});
</script>