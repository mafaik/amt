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
								<a href="{base_url('issue/add')}" class="btn btn-default btn-sm">
								<i class="fa fa-plus"></i>
								Add Ticket 
								</a>
							</div>
						</div>
						<div class="portlet-body">
							
							<!-- BEGIN FILTER -->
							<div class="row">
								<div class="col-md-12">
									<h4>Filter Tiket</h4>
									<form class="form-inline" role="form">
										<div class="form-group">
											<input type="email" class="form-control input-medium" id="exampleInputEmail2" placeholder="Nama Outlet">
										</div>
										<div class="form-group">
											<select name="order_status" class="form-control form-filter input-sm select2ku input-medium">
												<option value="">Status Tiket</option>
												<option value="pending">Solved</option>
												<option value="closed">Unsolved</option>
												<option value="closed">Progress</option>
											</select>
										</div>
										<div class="form-group">
											<div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy">
												<input type="text" class="form-control" placeholder="" readonly>
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
										</div>
										<button type="submit" class="btn grey-gallery">Filter</button>
									</form>
								</div>
							</div>
							<!-- END FILTER -->
							<br/>
							<div class="row top-news" style="margin-left: -15px !IMPORTANT; margin-right: -15px !IMPORTANT;">
								<div class="col-md-4">
									<a href="{base_url('issue/update/detail/3')}" class="btn red">
										<span>Outlet 1 </span>
										<em>ticket 10</em>
										<em>
										<i class="fa fa-tags"></i>
										Nama Teknisi </em>
										<em>Check In: -</em>
										<em>Check Out: -</em>

										<i class="fa fa-exclamation-triangle top-news-icon"></i>
									</a>
								</div>
								<div class="col-md-4">
									<a href="javascript:;" class="btn green">
										<span>
										Nama Outlet 2 </span>
										<em>Ticket 11</em>
										<em>
										<i class="fa fa-tags"></i>
										Nama Teknisi </em>
										<em>Check In: -</em>
										<em>Check Out: -</em>

										<i class="fa fa-check-circle top-news-icon"></i>
									</a>
								</div>
								<div class="col-md-4">
									<a href="javascript:;" class="btn yellow-crusta">
										<span>
										Outlet 3</span>
										<em>Ticket 12</em>
										<em>
										<i class="fa fa-tags"></i>
										Nama Teknisi </em>
										<em>Check In: -</em>
										<em>Check Out: -</em>

										<i class="fa fa-cogs top-news-icon"></i>
									</a>
								</div>

								<div class="col-md-4">
									<a href="javascript:;" class="btn green">
										<span>
										Outlet 4</span>
										<em>Ticket 13</em>
										<em>
										<i class="fa fa-tags"></i>
										Nama Teknisi </em>
										<em>Check In: -</em>
										<em>Check Out: -</em>

										<i class="fa fa-check-circle top-news-icon"></i>
									</a>
								</div>
								<div class="col-md-4">
									<a href="javascript:;" class="btn red">
										<span>
										Outlet 4</span>
										<em>Ticket 14</em>
										<em>
										<i class="fa fa-tags"></i>
										Nama Teknisi </em>
										<em>Check In: -</em>
										<em>Check Out: -</em>

										<i class="fa fa-exclamation-triangle top-news-icon"></i>
									</a>
								</div>
								
								<div class="col-md-4">
									<a href="javascript:;" class="btn yellow-crusta">
										<span>
										Outlet 6</span>
										<em>Ticket 17</em>
										<em>
										<i class="fa fa-tags"></i>
										Nama Teknisi </em>
										<em>Check In: -</em>
										<em>Check Out: -</em>

										<i class="fa fa-cogs top-news-icon"></i>
									</a>
								</div>
							</div>
							

							<!--- Begin Pagination -->
							<div class="row">
								<div class="col-md-12">
									<ul class="pagination">
										<li>
											<a href="javascript:;">
											<i class="fa fa-angle-left"></i>
											</a>
										</li>
										<li>
											<a href="javascript:;">
											1 </a>
										</li>
										<li>
											<a href="javascript:;">
											<i class="fa fa-angle-right"></i>
											</a>
										</li>
									</ul>
								</div>
							</dvi>
							<!-- End Pagination -->

						</div>
					</div>
					<!-- End: life time stats -->
				</div>
			</div>
			<!-- END PAGE CONTENT INNER -->