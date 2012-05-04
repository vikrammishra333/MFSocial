$(document).ready(function(){

    var updateBindings = function() {
        //imageHover();
        //openPopUp();
    };

   

    $('body').bind('ajaxComplete', function() {

        updateBindings();
        
    });

    updateBindings();
});
