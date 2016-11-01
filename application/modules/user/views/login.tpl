<!-- BEGIN LOGIN -->
<div class="content">
	<!-- BEGIN LOGIN FORM -->
	<form class="form-login" method="post" data-url="{$api_url}" data-session="{$session}" data-callback="{$callback}">
		<div id="alert-cont">	
			{$alert}
		</div>
		<input type="hidden" name="ip" value="{$ip}" />
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">Username</label>
			<input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username"/>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Password</label>
			<input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="password"/>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary btn-block uppercase">Login</button>
		</div>
	</form>
	<!-- END LOGIN FORM -->
	<!-- BEGIN FORGOT PASSWORD FORM -->
	<form class="forget-form" method="post" data-url="{$api_url}" data-callback="{base_url('issue')}">
		<div class="form-title">
			<span class="form-title">Lupa Password ?</span>
			<span class="form-subtitle">Isikan email akun anda.</span>
		</div>
		<div class="form-group">
			<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email"/>
		</div>
		<div class="form-actions">
			<button type="button" id="back-btn" class="btn btn-default">Kembali</button>
			<button type="submit" class="btn btn-primary uppercase pull-right">Kirim</button>
		</div>
	</form>
	<!-- END FORGOT PASSWORD FORM -->
</div>
<div class="copyright hide">
	 2014 © Monitoring Login.
</div>
<!-- END LOGIN -->