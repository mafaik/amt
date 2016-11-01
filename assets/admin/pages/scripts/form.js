

var FormJS = function () {

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

    var handlingFormSuccess = function( result, callbackUrl ) {

        //var result = jQuery.parseJSON(result);

        //console.log(result);

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
        
        window.location.replace(callbackUrl);

        Metronic.unblockUI();        

    };

    return {
        //main function to initiate the module
        init: function () {

            // use select2 dropdown instead of chosen as select2 works fine with bootstrap on responsive layouts.
            $('.select2_category').select2({
	            placeholder: "Select an option",
	            allowClear: true
	        });

            $('.select2ku').select2({
                placeholder: "Select an option",
                allowClear: false
            });

            $('.date-picker').datepicker({
                rtl: Metronic.isRTL(),
                autoclose: true
            });

            $('.select2_sample1').select2({
                placeholder: "Select a State",
                allowClear: true
            });

            $(".select2_sample2").select2({
                placeholder: "Type to select an option",
                allowClear: true,
                minimumInputLength: 1,
                query: function (query) {
                    var data = {
                        results: []
                    }, i, j, s;
                    for (i = 1; i < 5; i++) {
                        s = "";
                        for (j = 0; j < i; j++) {
                            s = s + query.term;
                        }
                        data.results.push({
                            id: query.term + i,
                            text: s
                        });
                    }
                    query.callback(data);
                }
            });

            $(".select2_sample3").select2({
                tags: ["red", "green", "blue", "yellow", "pink"]
            });

            /*
            $('.tambah-attachment').click(function() {
                var target = $(this).data('target');

                var html = $( target ).html();

                $(this).parents('.form-group').before(html);
            });

            $('body').on('click','a.remove-attachment',function(){

                $(this).parents('.form-group').remove();

            });

            */


            $('.files').on('change',function(){

                var files = $(this).prop('files');
                
                var html = '';
                var total = '';

                if( files.length > 0 )
                {
                    var label = ( files.length > 1 ) ? 'files' : 'file';
                    total += '<span class="help-block">'+files.length+' '+label+'</span>';
                }

                for( i=0; i < files.length;  i++ )
                {
                    html += '<span class="list-group-item">'+files[i].name+'</span>';
                }

                
                $('.total-file').html(total);
                $('.list-file').html(html);

            });

            //handle form submit
            $('.form-js').on('submit', function() {
                
                Metronic.clearAlert();

                Metronic.blockUI();

                var url = $(this).data('url');

                var callbackUrl = $(this).data('callback');

                if( $('.files').length > 0 )
                {
                    var data = new FormData($(this)[0]);
                    var contentType = false;

                }
                else
                {
                    var data = $(this).serialize();
                    var contentType = 'application/x-www-form-urlencoded';
                }

                var token = $('input[name="token"]').val();

                var posting = $.ajax({
                    url: url,
                    type: 'post',
                    data: data,
                    cache: false,
                    contentType: contentType,
                    processData: false,
                    headers: {
                        "AMT-API-KEY": 'g8gkgo0sw0w44gkos4o40ww0g88c0cwwsc4c8sk0',
                        'AMT-JWT': token
                    },
                    dataType: 'json',
                    error: function(e) {
                        //console.log(e);
                        handlingFormError(e);
                    },
                    success: function(result) {
                        console.log(result);
                        handlingFormSuccess(result, callbackUrl);
                    }
                });

                return false;

            });
            

        }

    };

}();