var $window = $(window);

$('#bikeSvg').delay(200).css({display:'block'}).fadeIn(50);

var bikeSvg = new Vivus('bikeSvg', {
    type: 'async',
    duration: 130,
    start: 'autostart',
    dashGap: 15,
    animTimingFunction: Vivus.EASE
});

$('.fade-in').delay(200).fadeIn(1000);