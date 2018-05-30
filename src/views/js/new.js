function validateForm() {
    var x = document.forms["nwfm"]["title"].value;
    var y = document.forms["nwfm"]["content"].value;
    if (x == "") {
        alert("Title cannot be empty.");
        return false;
    }
    if (y == "") {
        alert("Content cannot be empty.");
        return false;
    }
}
