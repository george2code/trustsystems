$( document ).ready(function() {

    $('.btn_send_from').click(function(e) {

        if ($('#invitation_senderName').val().length == 0) {
            $('#invitation_senderName').addClass('warning');
            e.preventDefault();
        }
        if ($('#invitation_replyToEmail').val().length == 0) {
            $('#invitation_replyToEmail').addClass('warning');
            e.preventDefault();
        }

    });

});