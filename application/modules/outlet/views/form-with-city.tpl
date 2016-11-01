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

							<form class="form-horizontal form-js" role="form" data-url="{$api_url}" data-callback="{base_url('outlet')}">
								{if $action == 'edit'}
								<input type="hidden" name="outlet_id" value="{$detail->outlet_id}" />
								{/if}
								<input type="hidden" name="group" value="engineer" />
								<div class="form-body">
									<div class="form-group">
										<label class="col-md-3 control-label">Outlet Name</label>
										<div class="col-md-4">
											<input type="text" name="name" value="{$detail->outlet_name}" class="form-control" placeholder="Outlet Name">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Outlet Address</label>
										<div class="col-md-6">
											<input type="text" name="address" value="{$detail->outlet_address}" class="form-control" placeholder="Outlet Address">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Phone Number</label>
										<div class="col-md-3">
											<input type="text" name="contact" value="{$detail->outlet_contact}" class="form-control" placeholder="Phone Number">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Username</label>
										<div class="col-md-3">
											<input type="text" name="username" value="{$detail->outlet_username}" class="form-control" placeholder="Username">
										</div>
									</div>
									{if $action == 'add' }
									<div class="form-group">
										<label class="col-md-3 control-label">Password</label>
										<div class="col-md-3">
											<input type="password" name="password" class="form-control" placeholder="Password">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Password Confirmation</label>
										<div class="col-md-3">
											<input type="password" name="password_confirmation" class="form-control" placeholder="Password Confirmation">
										</div>
									</div>
									{/if}
									<div class="form-group">
										<label class="col-md-3 control-label">Kota</label>
										<div class="col-md-3">
											<select name="city" class="form-control select2ku">
												{foreach from=$city item=c }
													{assign var="selected" value=""}
													{if $c == $detail->outlet_city}
														{assign var="selected" value="selected"}
													{/if}
													<option value="{$c}" {$selected}>{$c}</option>
												{/foreach}
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Provinsi {$detail->region}</label>
										<div class="col-md-3">
											<select name="region" class="form-control select2ku">
												{foreach from=$state item=s }
													{assign var="selected" value=""}
													{if $s == $detail->outlet_region}
														{assign var="selected" value="selected"}
													{/if}
													<option value="{$s}" {$selected}>{$s}</option>
												{/foreach}
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
										<label class="col-md-3 control-label">Technician</label>
										<div class="col-md-4">
											<input class="form-control" value="{$detail->staff_id}" type="hidden" name="staff_id"/>
											<div class="input-group">
												
												<input class="form-control" type="text" value="{$detail->staff_name}" name="staff_name" disabled/>
												<span class="input-group-btn">
													<a class="btn btn-success open-modal" data-url="{base_url('staff/table_modal')}" data-target="staff_id:staff_id|staff_name:name"><i class="fa fa-search"/></i></a>
												</span>
											</div>
										</div>
									</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button type="submit" class="btn grey-gallery">Submit</button>
											<a href="{base_url('outlet')}" class="btn default">Cancel</a>
										</div>
									</div>
								</div>
							</form>

							{if $action == 'edit'}
								</div>

								<div class="tab-pane fade" id="tab_password">
									<form class="form-horizontal form-js" role="form" data-url="{$api_url_password}" data-callback="{base_url('outlet')}">

										<div class="form-body">
											<input type="hidden" name="outlet_id" value="{$detail->outlet_id}" />
											<div class="form-group">
												<label class="col-md-3 control-label">password</label>
												<div class="col-md-3">
													<input type="password" name="password" class="form-control" placeholder="Password">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">password baru</label>
												<div class="col-md-3">
													<input type="password" name="new_password" class="form-control" placeholder="Password">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">konfirm password</label>
												<div class="col-md-3">
													<input type="password" name="password_confirmation" class="form-control" placeholder="Konfirm Password">
												</div>
											</div>
										</div>

										<div class="form-actions">
											<div class="row">
												<div class="col-md-offset-3 col-md-9">
													<button type="submit" class="btn grey-gallery">Submit</button>
													<a href="{base_url('outlet')}" class="btn default">Cancel</a>
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
					<div id="modal-ajax" class="modal container modal-scroll" tabindex="-1" aria-hidden="true"  data-height="480">
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT INNER -->