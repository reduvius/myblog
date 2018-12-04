// Hover effect for li buttons
$(document).ready(function(){
    $("#main div:first-child ul li").hover(function(){
        $(this).css("margin-left", "1.5em");
        }, function(){
        $(this).css("margin-left", "0.5em");
    });
});
