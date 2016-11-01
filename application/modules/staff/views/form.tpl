<!-- BEGIN PAGE CONTENT INNER -->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE FORM PORTLET-->
					<div class="portlet light">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs font-grey-gallery"></i>
								<span class="caption-subject font-grey-gallery bold uppercase">{$title}</span>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							{if $action == 'edit'}
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#tab_detail" data-toggle="tab">Detail </a>
								</li>
								<li>
									<a href="#tab_password" data-toggle="tab">Password </a>
								</li>
							</ul>

							<!-- START tab-content -->
							<div class="tab-content">
								<div class="tab-pane fade active in" id="tab_detail">
							{/if}

							<form class="form-horizontal form-js" role="form" data-url="{$api_url}" data-callback="{base_url('staff/administrator')}">
								{if $action == 'edit'}
								<input type="hidden" name="staff_id" value="{$detail->staff_id}" />
								{/if}
								{if $type == 'administrator'}
									<input type="hidden" name="group" value="administrator" />
								{else}
									<input type="hidden" name="group" value="engineer" />
								{/if}
								<input type="hidden" name="city" value="default" />
								<input type="hidden" name="region" value="default" />
								<div class="form-body">
									<div class="form-group">
										<label class="col-md-3 control-label">Name</label>
										<div class="col-md-4">
											<input type="text" name="name" value="{$detail->name}" class="form-control" placeholder="Name">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Address</label>
										<div class="col-md-4">
											<input type="text" name="address" value="{$detail->address}" class="form-control" placeholder="Address">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Username</label>
										<div class="col-md-4">
											<input type="text" name="username" value="{$detail->username}" class="form-control" placeholder="Username">
										</div>
									</div>
									{if $action == 'add' }
									<div class="form-group">
										<label class="col-md-3 control-label">Password</label>
										<div class="col-md-4">
											<input type="password" name="password" class="form-control" placeholder="Password">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Password Confirmation</label>
										<div class="col-md-4">
											<input type="password" name="password_confirmation" class="form-control" placeholder="Password Confirmation">
										</div>
									</div>
									{/if}
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button type="submit" class="btn grey-gallery">Save</button>
											<a href="{base_url('staff')}" class="btn default">Cancel</a>
										</div>
									</div>
								</div>
							</form>

							{if $action == 'edit'}
								</div>

								<div class="tab-pane fade" id="tab_password">
									<form class="form-horizontal form-js" role="form" data-url="{$api_url_password}" data-callback="{base_url('staff/administrator')}">

										<div class="form-body">
											<input type="hidden" name="staff_id" value="{$detail->staff_id}" />
											<div class="form-group">
												<label class="col-md-3 control-label">Old Password</label>
												<div class="col-md-3">
													<input type="password" name="password" class="form-control" placeholder="Old Password">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">New Password</label>
												<div class="col-md-3">
													<input type="password" name="new_password" class="form-control" placeholder="New Password">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">Password Confirmation</label>
												<div class="col-md-3">
													<input type="password" name="password_confirmation" class="form-control" placeholder="Password Confirmation">
												</div>
											</div>
										</div>

										<div class="form-actions">
											<div class="row">
												<div class="col-md-offset-3 col-md-9">
													<button type="submit" class="btn grey-gallery">Save</button>
													<a href="{base_url('staff')}" class="btn default">Cancel</a>
												</div>
											</div>
										</div>

									</form>
								</div>
							</div>
							<!-- END tab-content -->
							{/if}

						</div>
					</div>
					<!-- END SAMPLE FORM PORTLET-->
				</div>
			</div>
			<!-- END PAGE CONTENT INNER -->