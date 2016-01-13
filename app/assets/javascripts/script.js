$( document ).ready(function() {
    });

function getPercentage (num1, num2) {
    var percent = parseFloat((1 - (num1 / num2)) * 100).toFixed(2)
    return percent;
}

$(function(){

    //Tell Rails that we’re sending a JavaScript request
    $.ajaxSetup({
        'beforeSend': function (xhr){
            xhr.setRequestHeader("Accept", "text/javascript")}
    });


    $('.word_known').click(function(e){
        e.preventDefault();
        var div = $(this);
        $.ajax({
            url: '/parse/addwords',
            method: 'POST',
            dataType: 'html',
            data: {word: div.context.children[0].value}
        }).success(function(data){
            var frequency = parseInt(div.attr('value'));

            var wordCount = parseFloat($('#percentage').attr('name'));
            var userWordCount = parseFloat($('#percentage').attr('value')) - frequency;
            var known_percent = getPercentage(userWordCount, wordCount);

            var uniqueWordCount = parseFloat($('#unique-ratio').attr('name'));
            var uniqueUserWordCount = parseFloat($('#unique-ratio').attr('value')) - 1;
            var unique_percent = getPercentage(uniqueUserWordCount, uniqueWordCount);

            $('#percentage').attr('value', userWordCount);
            $('#percentage').html(known_percent);
            $('#unique-ratio').attr('value', uniqueUserWordCount);
            $('#unique-ratio').html(unique_percent);

            div.remove();
            $('.parse-' + data.replace("'", "_")).removeClass()
        }).error(function(err){
            console.log(err);
        })
    })

});


// Adding jQuery Plugin into Word List Sidebar

(function($){
    $(window).load(function(){
    $(".right-sidebar").mCustomScrollbar();
        });
    })(jQuery);

// trying to add Sticky sidebar

$(function() {

    var $sidebar   = $(".right-sidebar"), 
        $window    = $(window),
        offset     = $sidebar.offset(),
        topPadding = -150;

    $window.scroll(function() {
        if ($window.scrollTop() > offset.top) {
            $sidebar.stop().animate({
                marginTop: $window.scrollTop() - offset.top - topPadding
            });
        } else {
            $sidebar.stop().animate({
                marginTop: 40
            });
        }
    });
    
});