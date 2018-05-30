$(document).ready(function() {
    $("#plsi").click(function() {
        $(this).hide();
    });
});

$(document).ready(function() {
    var szbtn = $("#sec1-1 div:last-child button");
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

$(document).ready(function() {
	var content = $('#pst-cnt');
	var defaultSize = content.css('fontSize');
	$('#sec1-1 div:last-child button').click(function() {
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
        // moze i ovako, kao dole ispod
        //content.animate({fontSize: num}, 200);
    });
});

$(document).ready(function() {
    $("#sec1-2 div:last-child a:last-child").click(function() {
        return confirm('Are you sure you want to delete this post?');
    });
});

$(document).ready(function() {
    var sec2 = $("#sec2");
    $("#comm").click(function() {
        sec2.animate({height: 'toggle'}, 1000);
        var comm = $(this);
        if (comm.text() == 'Hide comment section ▴') {
            comm.text('Show comment section ▾');
        } else {
            comm.text('Hide comment section ▴');
        }
        return false;
    });
});

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
