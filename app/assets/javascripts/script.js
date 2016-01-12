$(function(){

    //Tell Rails that we’re sending a JavaScript request
    $.ajaxSetup({
        'beforeSend': function (xhr){
            xhr.setRequestHeader("Accept", "text/javascript")}
    });


    $('.word_known').click(function(e){
        e.preventDefault();
        console.log('clicked');
        var btn = $(this);
        console.log(btn);
        $.ajax({
            url: '/translate/addwords',
            method: 'POST',
            dataType: 'html',
            data: {word: btn[0].value}
        }).done(function(data){
            console.log(btn[0].value);
            btn.hide();
        }).error(function(err){
            console.log(err);
        })
    })


});