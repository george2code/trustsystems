// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

/* ---------------------------------------------------------------------- */
/*		Progress Bar
 /* ---------------------------------------------------------------------- */

initProgress('.progress');

function initProgress(el) {
    jQuery(el).each(function () {
        var pData = jQuery(this).data('progress');
        progress(pData, jQuery(this));
    });
}

function progress(percent, $element) {
    var progressBarWidth = 0;

    (function myLoop(i, max) {
        progressBarWidth = i * $element.width() / 100;
        setTimeout(function () {
            $element.find('div').find('small').html(i + '%');
            $element.find('div').width(progressBarWidth);
            if (++i <= max) myLoop(i, max);
        }, 10)
    })(0, percent);
}


$(document).ready(function () {

   // Review
    var b = $('.starbutton');
    var c = $('#starevaluationbutton');
    var $formContainer = $('.evaluate');


    var getStarClass = function (a) {
        a = parseInt(a, 10);
        switch (a) {
            case 1:
                return 'bia';
            case 2:
                return 'bic';
            case 3:
                return 'bie';
            case 4:
                return 'big';
            case 5:
                return 'bii';
            default:
                return 'biz';
        }
    };

    var changeRating = function (a) {
        $('#hfStars').val(a);
        setStars(a);
    };

    var changeDescription = function (a) {
        a = parseInt(a, 10);
        var b;
        switch (a) {
            case 1:
                b = '1 звезда: Плохо - неприемлемый опыт, неуважение к покупателю и грубое поведение персонала.';
                break;
            case 2:
                b = '2 звезды: Ниже среднего - неадекватный опыт со множеством недоразумений.';
                break;
            case 3:
                b = '3 звезды: Средне - допустимый опыт, но с некоторыми замечаниями.';
                break;
            case 4:
                b = '4 звезды: Отлично - достойное обращение и практически без замечаний.';
                break;
            case 5:
                b = '5 звезд: Замечательно - никаких оговорок, я рекомендую эту компанию любому пользователю.';
                break;
            default:
                b = 'Наведите курсор на звезды и нажмите, чтобы проголосовать';
        }
        $('.evaluate .desc').text(b);
    };

    var setStars = function (a) {
        $('#starevaluationbutton').attr('class', getStarClass(a));
    };

    c.on('mouseleave', function () {
        $(this).attr('class', getStarClass($('#hfStars').val()));
        changeDescription($('#hfStars').val());
    });
    b.on('mouseenter focus', function () {
        var h = $(this);
        if (!$formContainer.hasClass('disabled')) {
            f = h.index() + 1;
            changeDescription(f);
            setStars(h.index() + 1);
        }
    }).on('click', function (h) {
        h.preventDefault();
        if (!$formContainer.hasClass('disabled')) {
            changeRating(f);
        }
    }).on('keyup', function (i) {
        var h = '13';
        i.preventDefault();
        if (!$formContainer.hasClass('disabled') && i.which == h) {
            $('input[type="text"]').first().focus();
        }
    });


    $('.starbutton:last-child, .starbutton:first-child').on('blur', function () {
        c.attr('class', getStarClass($('#hfStars').val()));
        changeDescription($('#hfStars').val());
    });



    // set default rating if not 0
    if ($('#hfStars').val() != '0')
        changeRating(parseInt($('#hfStars').val()));


    // End review
});