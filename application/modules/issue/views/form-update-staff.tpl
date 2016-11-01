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

							<form class="form-horizontal form-js" role="form" data-url="{$api_url}" data-callback="{base_url('issue')}" >
								<div class="form-body">

									<input type="hidden" name="issue_id" value="{$detail->issue_id}" />
									
									<div class="form-group">
										<label class="col-md-3 control-label">Subject</label>
										<div class="col-md-4">
											<input type="text" class="form-control" name="subject" value="{$detail->subject}" placeholder="Enter text" disabled>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Description</label>
										<div class="col-md-3">
											<textarea class="form-control" name="issue" rows="5" disabled>
												{$detail->issue}
											</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Outlet</label>
										<div class="col-md-4">
											<input class="form-control" value="{$detail->outlet_id}" type="hidden" name="outlet_id"/>
											<div class="input-group">
												
												<input class="form-control" type="text" value="{$detail->outlet_name}" name="outlet_name" disabled/>
											</div>
										</div>
									</div>

									<div class="form-group">
									<label class="col-md-3 control-label">Attachment</label>
											{if $attachment != null }

												<div class="col-md-9">
													<div class="fileinput fileinput-new" data-provides="fileinput">
														{foreach from=$attachment item=a }
														<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
															<img src="{api_url('uploads/issue/')}{$a}" alt=""/>
														</div>
														{/foreach}
													</div>
												</div>

											{/if}
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

								</div>
									
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button type="submit" class="btn grey-gallery">Submit</button>
											<a href="{base_url('issue')}" class="btn default">Cancel</a>
										</div>
									</div>
								</div>
							</form>

						</div>
					</div>
					<!-- END SAMPLE FORM PORTLET-->
					<div id="modal-ajax" class="modal container modal-scroll" tabindex="-1" aria-hidden="true"  data-height="480">
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT INNER -->