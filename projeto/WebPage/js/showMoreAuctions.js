$(document).ready(onReady);

function onReady() {
    if ($("#hasExceeded").val() == "0")
        $("#showMoreAuctions").show();
    else $("#showMoreAuctions").hide();
}