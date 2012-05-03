$(document).ready(function(){

    var updateBindings = function() {
        //imageHover();
        openPopUp();
    };

    var showPopup = function() {
        alert('clicked');
    };

    var openPopUp = function(){
        $("#change_image_link").colorbox({transition:"none"});
    };

    $('body').bind('ajaxComplete', function() {

        updateBindings();
        
    });

    updateBindings();
});
