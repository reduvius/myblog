function validateForm() {
    var a = document.forms["nwf1"]["name"].value;
    var b = document.forms["nwf1"]["email"].value;
    var c = document.forms["nwf1"]["password"].value;
    var d = document.forms["nwf1"]["password_confirm"].value;
    if (a == "") {
        alert("Name must be filled out");
        return false;
    }
    if (b == "") {
        alert("Email must be filled out");
        return false;
    }
    if (c == "") {
        alert("Password must be filled out");
        return false;
    }
    if (c.length < 6) {
        alert("Password must be at least 6 characters long");
        return false;
    }
    if (d == "") {
        alert("Password confirmation must be filled out");
        return false;
    }
    if (c != d) {
        alert("Passwords do not match!");
        return false;
    }
}
