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
        }).done(function(data){
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

var sidebar = document.getElementById('sidebar');
Stickyfill.add(sidebar);