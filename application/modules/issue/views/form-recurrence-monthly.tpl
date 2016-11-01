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

							<form class="form-horizontal form-js" role="form" data-url="{$api_url}" data-callback="{base_url('issue')}" enctype="multipart/form-data">
								<div class="form-body">

									{if $action == 'edit'}
									<input type="hidden" name="issue_id" value="{$detail->issue_id}" />
									{/if}
									<div class="form-group">
										<label class="col-md-3 control-label">Subject</label>
										<div class="col-md-4">
											<input type="text" class="form-control" name="subject" value="{$detail->subject}" placeholder="Enter text">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Description</label>
										<div class="col-md-3">
											<textarea class="form-control" name="issue" rows="5">{$detail->issue}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Outlet</label>
										<div class="col-md-4">
											<input class="form-control" value="{$detail->outlet_id}" type="hidden" name="outlet_id"/>
											<div class="input-group">
												
												<input class="form-control" type="text" value="{$detail->outlet_name}" name="outlet_name" disabled/>
												<span class="input-group-btn">
													<a class="btn btn-success open-modal" data-url="{base_url('outlet/table_modal')}" data-target="outlet_id:outlet_id|outlet_name:outlet_name"><i class="fa fa-search"/></i></a>
												</span>
											</div>
										</div>
									</div>
									
									<div class="form-group">
									<label class="col-md-3 control-label">Attachment</label>
										<div class="col-md-3">
											{if ($action == 'edit') }
												<div>
												{if $detail->attachment == null}
													<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt=""/>
												{else}
													{assign var=imageList value=";"|explode:$detail->attachment}
													{for $foo=0 to $imageList|@count - 1}
													    <img src="{api_url('uploads/issue/')}{$imageList[$foo]}" alt="" style="width: 400px;"/><br>
													{/for}
												{/if}
												</div>
												<br>
											{/if}
											<span class="btn default btn-file">
												{if $action == 'edit'}
											    	Replace <input type="file" name="filename[]" class="files" multiple>
											    {else}
											    	Select <input type="file" name="filename[]" class="files" multiple>
											    {/if}
											</span>
											 <label class="total-file">
										    </label>

											<div class="list-file list-group help-block">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Repeat On Date</label>
										<div class="col-md-4">
											<select name="day" class="form-control">
												{for $foo=1 to 28}
													<option value={$foo}>{$foo}</option>
												{/for}
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Repeat For</label>
										<div class="col-md-4">
											<select name="interval" class="form-control">
												<option value="1">1 Month</option>
												<option value="2">2 Months</option>
												<option value="3">3 Months</option>
												<option value="4">4 Months</option>
												<option value="5">5 Months</option>
												<option value="6">6 Months</option>
												<option value="7">7 Months</option>
												<option value="8">8 Months</option>
												<option value="9">9 Months</option>
												<option value="10">10 Months</option>
												<option value="11">11 Months</option>
												<option value="12">12 Months</option>
											</select>
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