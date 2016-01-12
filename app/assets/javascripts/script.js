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
            $('.' + data).removeClass()
        }).error(function(err){
            console.log(err);
        })
    })

});