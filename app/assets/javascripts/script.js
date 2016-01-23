//Fancy way to resolve jQuery loading with turbolinks
var ready;
ready = function() {


    function getPercentage (num1, num2) {
        var percent = parseFloat((1 - (num1 / num2)) * 100).toFixed(2)
        return percent;
    }


    //Tell Rails that we’re sending a JavaScript request
    $.ajaxSetup({
        'beforeSend': function (xhr){
            xhr.setRequestHeader("Accept", "text/javascript")}
    });

    //Remove word from users lexicon (lexicon/index)
    $('.parse-lexicon').click(function(e){
        e.preventDefault();
        var button = $(this);

        $.ajax({
            url: '/lexicon',
            method: 'DELETE',
            dataType: 'HTML',
            data: {id: button.attr('id')}
        }).success(function(data){
            button.remove();
        }).error(function(err){
            console.log(err)
        })
    });

    //Change user's language on home page via learning language click
    $('.learning-lang-switch').click(function(e){
        e.preventDefault()
        var langDiv = $(this);

        $.ajax({
            url: '/update',
            method: 'PUT',
            dataType: 'JSON',
            data: {user_language: langDiv.attr('value')}
        }).success(function(data){
            $('#session_language').html(data.name);
            $('#user-flag-icon').attr('class', '');
            $('#user-flag-icon').addClass("flag-icon flag-icon-" + data.flag);

        }).error(function(err){
            console.log(err)
        });
        return false;
    });

    // Change user's language on home page via form
    $('#user_language_change').on('submit', function(e){
        e.preventDefault();
        var form = $(this);

        $.ajax({
            url: '/update',
            method: 'PUT',
            dataType: 'JSON',
            data: {user_language_symbol: form[0][1].value}
        }).success(function(data){
            $('#session_language').html(data.name);
            $('#user-flag-icon').attr('class', '');
            $('#user-flag-icon').addClass("flag-icon flag-icon-" + data.flag);

        }).error(function(err){
            console.log(err)
        });
        return false;
    });

    //Translate word on click
    $('.prs').on('click', function(e){
        e.preventDefault();
        var word = $(this);
        $('#translated').empty();
        $('#to-translate').text('Translating.');

        setTimeout(function(){
            $('#to-translate').append('.')
        }, 250);

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
            $('#percentage').html(known_percent + '%');
            $('#unique-ratio').attr('value', uniqueUserWordCount);
            $('#unique-ratio').html(unique_percent + '%');

            //Update Progress Bar with updated percentage
            $('#progressBar').css('width', known_percent + '%');
            $('#percentage').text(known_percent + '%');
            $('#ratioProgress').css('width', unique_percent + '%');
            $('#unique-ratio').text(unique_percent + '%');

            //Remove the word count button div then remove the
            //highlight class on associated words
            div.remove();
            $('.parse-' + data.replace("'", "_")).removeClass()

        }).error(function(err){
            console.log(err);
        })
    });

    // Adding jQuery Plugin into Word List Sidebar
    $(".right-sidebar").mCustomScrollbar({mouseWheel:{ scrollAmount: 10 }}, {scrollInertia: 0});

    // Adding Scrollbar to the Learning Languages section
    $("#left2").mCustomScrollbar();

    // Adding Scrollbar to the Learning Languages section
    $("#left3").mCustomScrollbar();

    // Hover over Left Bar Panel 1 settings

    $("#left1").mouseenter(function(){
        $("#left1").css("background-color", "white");
    }).mouseleave(function (){
        $("#left1").css("background-color", "white");
    });
    
    // Hover over Left Bar Panel 2 settings

     $("#left2").mouseenter(function(){
        $("#left2").css("background-color", "white");
    }).mouseleave(function (){
        $("#left2").css("background-color", "white");
    });

    // Hover over Left Bar Panel 3 settings

    $("#left3").hover(function(){
        $("#left3").css("background-color", "white");
        }, function(){
        $("#left3").css("background-color", "white");
    });

    //// trying to add Sticky sidebar

    var $sidebar   = $(".right-sidebar"),
        $window    = $(window),
        offset     = $sidebar.offset(),
        topPadding = -150;

    if (offset) {
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
    }

    function show_loading() {
        $("#loading").show();
    };

    // $(document).ready(function() {
        $('#parse').click(function(){
        show_loading();
        });
    // });

    $('#fullpage').fullpage({
        //Navigation
        menu: '#menu',
        lockAnchors: false,
        anchors:['firstPage', 'secondPage', 'thirdPage'],
        navigation: false,
        navigationPosition: 'right',
        navigationTooltips: ['firstSlide', 'secondSlide'],
        showActiveTooltip: false,
        slidesNavigation: true,
        slidesNavPosition: 'bottom',

        //Scrolling
        css3: true,
        scrollingSpeed: 2000,
        autoScrolling: true,
        fitToSection: true,
        fitToSectionDelay: 2000,
        scrollBar: false,
        easing: 'easeInOutCubic',
        easingcss3: 'ease',
        loopBottom: false,
        loopTop: false,
        loopHorizontal: true,
        continuousVertical: false,
        normalScrollElements: '#element1, .element2',
        scrollOverflow: false,
        touchSensitivity: 30,
        normalScrollElementTouchThreshold: 5,

        //Accessibility
        keyboardScrolling: true,
        animateAnchor: true,
        recordHistory: true,

        //Design
        controlArrows: true,
        verticalCentered: true,
        resize : false,
        sectionsColor : ['#ccc', '#fff'],
        paddingTop: '3em',
        paddingBottom: '10px',
        fixedElements: '#header, .footer',
        responsiveWidth: 0,
        responsiveHeight: 0,

        //Custom selectors
        sectionSelector: '.section',
        slideSelector: '.slide',

        //events
        onLeave: function(index, nextIndex, direction){},
        afterLoad: function(anchorLink, index){},
        afterRender: function(){},
        afterResize: function(){},
        afterSlideLoad: function(anchorLink, index, slideAnchor, slideIndex){},
        onSlideLeave: function(anchorLink, index, slideIndex, direction, nextSlideIndex){}
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);
