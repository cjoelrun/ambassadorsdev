$(document).ready(function(){
    $("#user_same_address").change(function(){
        if ($(this).is(':checked')) {
            $("#permanent_address").slideUp("fast");    //Slide Up Effect
        } else {
            $("#permanent_address").slideDown("fast"); //Slide Down Effect
        }
    });
});