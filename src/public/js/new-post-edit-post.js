// NEW FORM VALIDATION
function validateNewForm() {
    var title = document.forms["new-form"]["title"].value;
    var content = document.forms["new-form"]["content"].value;
    var val_info = document.getElementById("val-info");

    if (title == "") {
        val_info.innerHTML = "Title cannot be empty.";
        return false;
    }
    if (content == "") {
        val_info.innerHTML = "Content cannot be empty.";
        return false;
    }
}

// EDIT FORM VALIDATION
function validateEditForm() {
    var title = document.forms["edit-form"]["title"].value;
    var content = document.forms["edit-form"]["content"].value;
    var val_info = document.getElementById("val-info");

    if (title == "") {
        val_info.innerHTML = "Title cannot be empty.";
        return false;
    }
    if (content == "") {
        val_info.innerHTML = "Content cannot be empty.";
        return false;
    }
}
