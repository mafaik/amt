<!-- BEGIN PAGE CONTENT INNER -->
			<div class="row">
				<div class="col-md-12">
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
							<form class="form-horizontal" role="form" action="{$url}" method="POST">
								<div class="form-body">
									<div class="form-group">
										<label class="col-md-3 control-label">Rentang Waktu</label>
										<div class="col-md-3">
											<select class="form-control" name="range">
												<option value="all">Tidak Ada</option>
												<option value="week">1 Minggu</option>
												<option value="month">1 Bulan</option>
												<option value="year">1 Tahun</option>
												<option value="else">Lainnya</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Tanggal Awal</label>
										<div class="col-md-3">
											<div class="input-group input-medium date date-picker" data-date-format="yyyy-mm-dd">
												<input type="text" name="date_start" class="form-control" placeholder="" readonly>
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Tanggal Akhir</label>
										<div class="col-md-3">
											<div class="input-group input-medium date date-picker" data-date-format="yyyy-mm-dd">
												<input type="text" name="date_end" class="form-control" placeholder="" readonly>
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Status</label>
										<div class="col-md-3">
											<select class="form-control" name="status">
												<option value="true">Aktif</option>
												<option value="false">Tidak Aktif</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button type="submit" class="btn grey-gallery">Submit</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT INNER -->