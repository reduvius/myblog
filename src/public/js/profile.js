$(document).ready(function(){
    var stats = $("#stats");
    $("#show").click(function(){
        stats.slideToggle(800);
        var show = $(this);
        if (show.text() == 'Hide stats ▴') {
            show.text('Show stats ▾');
        } else {
            show.text('Hide stats ▴');
        }
        return false;
    });
});
