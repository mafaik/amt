

var ModalAjax = function () {

    return {
        //main function to initiate the module
        init: function () {

            
             // general settings
            $.fn.modal.defaults.spinner = $.fn.modalmanager.defaults.spinner = 
              '<div class="loading-spinner" style="width: 200px; margin-left: -100px;">' +
                '<div class="progress progress-striped active">' +
                  '<div class="progress-bar" style="width: 100%;"></div>' +
                '</div>' +
              '</div>';

            $.fn.modalmanager.defaults.resize = true;

            var $modal = $('#modal-ajax');
            var target = [];

            $('.portlet').on('click','.open-modal', function(){
                // create the backdrop and wait for next modal to be triggered
                $('body').modalmanager('loading');
                var url = $(this).data('url');

                if( $(this).data('target') && $(this).data('target') != '' )
                {
                    target = $(this).data('target').split('|');
                }

                setTimeout(function(){
                    $modal.load(url, '', function(){
                        $modal.modal();
                    });
                }, 1000);
            });

            

            $modal.on('click', '.pilih', function(){
                
                var detail = $(this).data('detail');

                if( target.length > 0 )
                {
                    var t = [];
                    var input,value;

                    for( i=0; i<target.length; i++ )
                    {
                        t = target[i].split(':');
                        if( t.length > 0 )
                        {
                            input = $('input[name="'+t[0]+'"]');
                        }

                        input.val(detail[t[1]])
                    }
                }

                $modal.modal('hide');
            });
            

        }

    };

}();