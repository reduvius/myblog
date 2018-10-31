// Please sign in
$(document).ready(function() {
    $("#plsi").click(function() {
        $(this).hide();
    });
});

// Show/hide font size
$(document).ready(function() {
    var szbtn = $("#sec1 div:last-child button");
    $("#show-size").click(function() {
        szbtn.fadeToggle(800);
        var span = $("#show-size span");
        if (span.text() == '◂') {
            span.text('▸');
        } else {
            span.text('◂');
        }
        return false;
    });
});

// Increase/decrease font size
$(document).ready(function() {
	var content = $('#pst-cnt');
	var defaultSize = content.css('fontSize');
	$('#sec1 div:last-child button').click(function() {
        var num = parseFloat(content.css('fontSize'));
        switch (this.id) {
            case 'increase':
                num *= 1.1;
                break;
            case 'decrease':
                num /= 1.1;
                break;
            default:
                num = parseFloat(defaultSize);
        }
        content.css('fontSize', num);
        // other way to do the same:
        //content.animate({fontSize: num}, 200);
    });
});

// Confirm post delete
$(document).ready(function() {
    $("#del").click(function() {
        return confirm('Are you sure you want to delete this post?');
    });
});

// Show/hide comment section
$(document).ready(function() {
    var cs = $("#comment-section");
    $("#comm").click(function() {
        cs.animate({height: 'toggle'}, 1000);
        var comm = $(this);
        if (comm.text() == 'Hide comment section ▴') {
            comm.text('Show comment section ▾');
        } else {
            comm.text('Hide comment section ▴');
        }
        return false;
    });
});

// Validate comment form
function validateForm() {
    var x = document.forms["nwfm1"]["comm-name"].value;
    var y = document.forms["nwfm1"]["comment"].value;
    if (x == "") {
        alert("Name must be filled out.");
        return false;
    }
    if (y == "") {
        alert("Comment cannot be empty.");
        return false;
    }
}
