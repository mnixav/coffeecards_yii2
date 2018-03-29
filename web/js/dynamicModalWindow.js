

$('.card-button').click(function (event) {
    var modal = $('#openCardModal');
    modal.find('.modal-body1').html('');
    var button = $(this);
    var card_id = button.data('card_id');
    $.ajax({
        url: "../card/open?id=" + card_id,
        data: {

        },
        success: function( result ) {
            modal.find('.modal-body1').html(result);
            modal.modal('toggle');
        }

    });
});
