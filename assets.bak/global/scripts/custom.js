$(document).on("click", ".open-ImageDialog", function () {
     var image_url = $(this).data('id');
     $(".modal-body").html('<img class="img-responsive" src="' + image_url + '"/>');
});