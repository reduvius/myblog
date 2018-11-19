// NEW FORM VALIDATION
function validateNewForm() {
    var x = document.forms["new-form"]["title"].value;
    var y = document.forms["new-form"]["content"].value;
    if (x == "") {
        alert("Title cannot be empty.");
        return false;
    }
    if (y == "") {
        alert("Content cannot be empty.");
        return false;
    }
}

// EDIT FORM VALIDATION
function validateEditForm() {
    var x = document.forms["edit-form"]["title"].value;
    var y = document.forms["edit-form"]["content"].value;
    if (x == "") {
        alert("Title cannot be empty.");
        return false;
    }
    if (y == "") {
        alert("Content cannot be empty.");
        return false;
    }
}
