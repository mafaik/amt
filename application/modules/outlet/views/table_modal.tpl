<!-- BEGIN PAGE CONTENT INNER -->

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title">{$title}</h4>
</div>
<div class="modal-body">
	<div class="row">
		<div class="col-md-12">
			<div class="table-container">
				<table class="table table-striped table-bordered table-hover" id="datatable_ajax" data-url="{$table_url}">
				<thead>
				<tr role="row" class="heading">
					<th width="2%">
						 No
					</th>
					<th width="15%">
						 Outlet Name
					</th>
					<th width="10%">
						 Technician Name
					</th>
					<th width="10%">
						 Action
					</th>
				</tr>
				<tr role="row" class="filter">
					<td>
					</td>
					<td>
						<input type="text" class="form-control form-filter input-sm" name="outlet_name">
					</td>
					<td>
					</td>
					<td>
						<div class="margin-bottom-5">
							<button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> Search</button>
							<button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> Reset</button>
						</div>
					</td>
				</tr>
				</thead>
				<tbody>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn default" data-dismiss="modal">Close</button>
</div>


<script>
jQuery(document).ready(function() {      
    
    TableAjax.init();
   
});
</script>

