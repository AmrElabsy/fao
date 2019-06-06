$(document).ready(function () {
    
    var mainVD = $(".video-gallery > div > div.mainV > div"),
        mainV = $(".video-gallery > div > div > video"),
        mainVDC = mainVD.attr('class'),
        targettedVD,
        targettedVDC,
        targettedV,
        tempForMain,
        tempForTargetted;
    var smallD = $(".video-gallery > .small-videos > div > div");

    smallD.click(function () {
        targettedVDC = $(this).attr('class');
        targettedVD = $(this);
        targettedV = $(targettedVDC + " > video");

        tempForMain = mainVDC;
        tempForTargetted = targettedVDC;

        mainVD.removeClass();
        targettedVD.removeClass();

        mainVD.addClass(tempForTargetted);
        targettedVD.addClass(tempForMain);

        mainV = $("." + mainVDC + " > video");
        targettedV = $("." + targettedVDC + " > video");

        mainV.attr('src', "static/videos/" + mainVDC + ".mp4");
        targettedV.attr('src', "static/videos/" + targettedVDC + ".mp4");
    });


    $('.link').click(function () {
        $(this).parent().animate({ height: '760px' }),
        $('.navbar1').animate({ height: '2500px' }),
        $(this).hide(),
        $(this).next("ul").show(),
        $(this).next('ul').children().children().show();
    });


    $('.less').click(function () {
        $(this).parent().parent().parent("div").animate({ height: '250px' }),
        $('.navbar1').animate({ height: '1700px' }),
        $(this).parent().parent("ul").siblings(".link").show(),
        $(this).parent().parent("ul").hide(),
        $(this).hide();


    });


    $('.fullBackground').fullClip({
        images: ['static/images/42.jpg', 'static/images/44.jpg', 'static/images/43.jpg', 'static/images/11.jpg', 'static/images/12.jpg', 'static/images/27.jpg', 'static/images/25.jpg', 'static/images/29.png'],
        transationTime: 2000,
        wait: 5000
    });



});