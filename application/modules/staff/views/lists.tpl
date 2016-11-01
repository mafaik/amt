<!-- BEGIN PAGE CONTENT INNER -->
			<div class="row">
				<div class="col-md-12">
					<!-- Begin: life time stats -->
					<div class="portlet light">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-list font-grey-gallery"></i>
								<span class="caption-subject font-grey-gallery bold uppercase">{$title}</span>
							</div>
							<div class="actions">
								<a href="{base_url('staff/add')}" class="btn btn-default btn-sm">
								<i class="fa fa-plus"></i>
								Add New Technician
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-container">
								<table class="table table-striped table-bordered table-hover" id="datatable_ajax" data-url="{$table_url}">
								<thead>
								<tr role="row" class="heading">
									<th width="2%">
										 No
									</th>
									<th width="15%">
										 Name
									</th>
									<th width="10%">
										 Number Of Outlet
									</th>
									<th width="10%">
										 Duty Status
									</th>
									<th width="15%">
										 Action
									</th>
								</tr>
								<tr role="row" class="filter">
									<td>
									</td>
									<td>
										<input type="text" class="form-control form-filter input-sm" name="staff_name">
									</td>
									<td>
									</td>
									<td>
										<select name="status_available" class="form-control form-filter input-sm">
											<option value="">Select...</option>
											<option value="off">Free</option>
											<option value="on">On Duty</option>
										</select>
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
					<!-- End: life time stats -->
				</div>
			</div>
			<!-- END PAGE CONTENT INNER -->