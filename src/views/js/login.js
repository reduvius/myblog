function validateForm() {
    var x = document.forms["nwf1"]["email"].value;
    var y = document.forms["nwf1"]["password"].value;
    if (x == "") {
        alert("Email must be filled out");
        return false;
    }
    if (y == "") {
        alert("Password must be filled out");
        return false;
    }
}
