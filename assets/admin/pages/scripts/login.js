var Login = function() {

    var handlingFormError = function(result) {

        var response = {};

        if(  result.responseText )
        {
            response = jQuery.parseJSON(result.responseText);
        }
        
        var message = 'koneksi error';

        if( response.message )
        {
            message = response.message;
        }
        
        Metronic.alert({
            type: 'danger',
            message: message,
            container: '#alert-cont',
            place: 'prepend'
        });

        Metronic.unblockUI();

    };

    var handlingFormSuccess = function( result, sessionUrl ,callbackUrl ) {


        if( !result.status )
        {
            Metronic.alert({
                type: 'danger',
                message: result.message,
                container: '#alert-cont',
                place: 'prepend'
            });

            Metronic.unblockUI();

            return false;
        }

        //var data = { outlet_id: result.data.outlet_id, name: result.data.name, role: result.data.role, token: result.data.token };

        var data = { data: JSON.stringify(result.data) }; 

        console.log(data);

        var posting = $.ajax({
            url: sessionUrl,
            type: 'post',
            data: data,
            dataType: 'json'
        });
        
        posting.done(function(result) {

            //return false;

            if( !result.status )
            {
                Metronic.alert({
                    type: 'danger',
                    message: result.message,
                    container: '#alert-cont',
                    place: 'prepend'
                });

                Metronic.unblockUI();

                return false;
            }

            window.location.replace(callbackUrl)
            Metronic.unblockUI(); 

        });
              

    };

    var handleForgetPassword = function() {
        $('.forget-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
                email: {
                    required: true,
                    email: true
                }
            },

            messages: {
                email: {
                    required: "Email is required."
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   

            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function(error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function(form) {
                form.submit();
            }
        });

        $('.forget-form input').keypress(function(e) {
            if (e.which == 13) {
                if ($('.forget-form').validate().form()) {
                    $('.forget-form').submit();
                }
                return false;
            }
        });

        jQuery('#forget-password').click(function() {
            jQuery('.login-form').hide();
            jQuery('.forget-form').show();
        });

        jQuery('#back-btn').click(function() {
            jQuery('.login-form').show();
            jQuery('.forget-form').hide();
        });

    }

    var handleRegister = function() {

        function format(state) {
            if (!state.id) return state.text; // optgroup
            return "<img class='flag' src='../../assets/global/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
        }

        if (jQuery().select2) {
            $("#select2_sample4").select2({
                placeholder: '<i class="fa fa-map-marker"></i>&nbsp;Select a Country',
                allowClear: true,
                formatResult: format,
                formatSelection: format,
                escapeMarkup: function(m) {
                    return m;
                }
            });


            $('#select2_sample4').change(function() {
                $('.register-form').validate().element($(this)); //revalidate the chosen dropdown value and show error or success message for the input
            });
        }

        $('.register-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {

                fullname: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                address: {
                    required: true
                },
                city: {
                    required: true
                },
                country: {
                    required: true
                },

                username: {
                    required: true
                },
                password: {
                    required: true
                },
                rpassword: {
                    equalTo: "#register_password"
                },

                tnc: {
                    required: true
                }
            },

            messages: { // custom messages for radio buttons and checkboxes
                tnc: {
                    required: "Please accept TNC first."
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   

            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function(error, element) {
                if (element.attr("name") == "tnc") { // insert checkbox errors after the container                  
                    error.insertAfter($('#register_tnc_error'));
                } else if (element.closest('.input-icon').size() === 1) {
                    error.insertAfter(element.closest('.input-icon'));
                } else {
                    error.insertAfter(element);
                }
            },

            submitHandler: function(form) {
                form.submit();
            }
        });

        $('.register-form input').keypress(function(e) {
            if (e.which == 13) {
                if ($('.register-form').validate().form()) {
                    $('.register-form').submit();
                }
                return false;
            }
        });

        jQuery('#register-btn').click(function() {
            jQuery('.login-form').hide();
            jQuery('.register-form').show();
        });

        jQuery('#register-back-btn').click(function() {
            jQuery('.login-form').show();
            jQuery('.register-form').hide();
        });
    }


    var handleFormSubmit = function() {

        $('.form-login').on('submit', function() {
                
                Metronic.clearAlert();

                Metronic.blockUI();

                var url = $(this).data('url');

                var callbackUrl = $(this).data('callback');
                var sessionUrl = $(this).data('session');

                
                var data = $(this).serialize();
                var contentType = 'application/x-www-form-urlencoded';
                

                var posting = $.ajax({
                    url: url,
                    type: 'post',
                    data: data,
                    cache: false,
                    contentType: contentType,
                    processData: false,
                    headers: {
                        "AMT-API-KEY": 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0'
                    },
                    dataType: 'json',
                    error: function(e) {
                        //console.log(e);
                        handlingFormError(e);
                    },
                    success: function(result) {
                        console.log(result);
                        handlingFormSuccess(result, sessionUrl, callbackUrl);
                    }
                });

                return false;

            });

    }   


    return {
        //main function to initiate the module
        init: function() {

            handleForgetPassword();
            handleRegister();
            handleFormSubmit();

        }

    };

}();