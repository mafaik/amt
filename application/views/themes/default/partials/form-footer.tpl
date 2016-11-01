<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="{base_url()}assets/global/plugins/select2/select2.min.js"></script>
<script src="{base_url()}assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<script type="text/javascript" src="{base_url()}assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="{base_url()}assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="{base_url()}assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="{base_url()}assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
<script type="text/javascript" src="{base_url()}assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="{base_url()}assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/pages/scripts/form.js" type="text/javascript"></script>
<script src="{base_url()}assets/global/scripts/datatable.js"></script>
<script src="{base_url()}assets/admin/pages/scripts/table-ajax.js"></script>
<script src="{base_url()}assets/admin/pages/scripts/modal-ajax.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
   	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	Demo.init(); // init demo features
	FormJS.init();
	ModalAjax.init();
   	
});
</script>
