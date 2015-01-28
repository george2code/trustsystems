$( document ).ready(function() {


    $('#flag li').click(function() {
        var locale = $(this).attr('data-locale');
        var prefix = "";

        switch(locale) {
            case 'ru':
                prefix = "+7";
                break;
            case 'uk':
                prefix = "+380";
                break;
            case 'en':
                prefix = "+1";
                break;
            case 'ba':
                prefix = "+375";
                break;
            default:
                break;
        }

        if (prefix != "") {
            $('#user_phone').val(prefix);
        }
    });

});