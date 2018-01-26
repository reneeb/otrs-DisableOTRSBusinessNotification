Core.App.Ready( function() {
    $('.OTRSBusinessRequired').each( function() {
        if ( $(this).parent().nodeName == "li" ) {
            $(this).parent().remove();
        }
        else {
            $(this).remove();
        }
    });
});
