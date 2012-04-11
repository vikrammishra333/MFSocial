$(document).ready(function(){

    var updateBindings = function() {
        //$('#profile_image').mouseover(showChangeImageLink);
        //$('#profile_image').mouseout(hideChangeImageLink);
        $('#change_image_link').click(showPopup)
    };

    var showPopup = function() {
        alert('clicked');
    };



    $('body').bind('ajaxComplete', function() {

        updateBindings();
        
    });

    updateBindings();
});
