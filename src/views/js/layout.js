// nacin da se ovo dole odradi u cistom JS-u
/*function hdpAct() {
    var p1 = document.getElementById('hdp1')
    var p2 = document.getElementById('hdp2');
    p1.style.marginLeft='-5em';
    p2.style.marginLeft='6em';
}*/

$(document).ready(function() {
    var p1 = $("header p:first-child");
    var p2 = $("header p:last-child");

    $("header").hover(function() {
        p1.css("marginLeft", "-5em")
        p2.css("marginLeft", "6em")
    });
})
