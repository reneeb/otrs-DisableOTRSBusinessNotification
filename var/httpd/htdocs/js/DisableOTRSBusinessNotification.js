Core.App.Ready( function() {
    $('.OTRSBusinessRequired').each( function() {
        console.debug( $(this).parent().nodeName );

        if ( $(this).parent().nodeName == "li" ) {
            $(this).parent().remove();
        }
        else {
            $(this).remove();
        }
    });
});
