$(document).ready(function(){
    if ($('#user_same_address').is(':checked')) {
        $("#permanent_address").slideUp("fast");    //Slide Up Effect
    } else {
        $("#permanent_address").slideDown("fast"); //Slide Down Effect
    }

    $("#user_same_address").change(function(){ // User Edit Form - Hide/Show Permanent Address
        if ($(this).is(':checked')) {
            $("#permanent_address").slideUp("fast");    //Slide Up Effect
        } else {
            $("#permanent_address").slideDown("fast"); //Slide Down Effect
        }
    });

    $("#change-password-button").click(function(){ // User Edit Form - Hide/Show Password Edit
	if($("#change-password").is(':hidden')) {
            $("#change-password").slideDown("fast");
	    $("#change-password-button").html("Cancel Change Password");
	} 
	else {
	    $("#change-password").slideUp("fast");
	    $("#change-password-button").html("Change Password");
	}
    });

    // $(document).ready(function() {
    // 	$('.table tr').click(function() {
    //         var href = $(this).find("a").attr("href");
    //         if(href) {
    // 		window.location = href;
    //         }
    // 	});
    // });

});
