// Close error message
$(document).ready(function() {
    $("#err p span").click(function() {
        $("#err").hide();
    });
});

// Close success message
$(document).ready(function() {
    $("#succ p span").click(function() {
        $("#succ").hide();
    });
});

// Slide toggle upload form
$(document).ready(function(){
    $("#container #flip").click(function(){
        $("#container form").slideToggle("800");
    });
});
