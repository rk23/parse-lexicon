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

    //Translate word on click
    $('.prs').on('click', function(e){
        e.preventDefault();
        var word = $(this);

        $.ajax({
            url: '/parse/translate',
            method: 'POST',
            dataType: 'html',
            data: {word: word.text()}
        }).success(function(data){
            $('#to-translate').text(word.text())
            $('#translated').text(data)
        }).error(function(err){
            console.log(err)
            $('#translated').text("Unable to translate")
        })
    });


    //Add word to known words
    $('.word_known').click(function(e){
        e.preventDefault();
        var div = $(this);
        $.ajax({
            url: '/parse/addwords',
            method: 'POST',
            dataType: 'html',
            data: {word: div.context.children[0].value}
        }).success(function(data){
            //Frequency of word in current text
            var frequency = parseInt(div.attr('value'));

            //Word count in current text
            var wordCount = parseFloat($('#percentage').attr('name'));

            //User unknown word count in text, hence the subtraction when word added
            var userWordCount = parseFloat($('#percentage').attr('value')) - frequency;
            var known_percent = getPercentage(userWordCount, wordCount);

            //Unique word count in current text
            var uniqueWordCount = parseFloat($('#unique-ratio').attr('name'));

            //User unknown unique word count, hence the subtraction when word added
            var uniqueUserWordCount = parseFloat($('#unique-ratio').attr('value')) - 1;
            var unique_percent = getPercentage(uniqueUserWordCount, uniqueWordCount);

            //Update percentages as well as stored values used in this script
            $('#percentage').attr('value', userWordCount);
            $('#percentage').html(known_percent);
            $('#unique-ratio').attr('value', uniqueUserWordCount);
            $('#unique-ratio').html(unique_percent);

            //Remove the word count button div then remove the
            //highlight class on associated words
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