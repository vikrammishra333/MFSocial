$(document).ready(function(){

    
    var showChangeImageLink = function() {
        $('#change_image_link').removeClass("change_image_link");
        $('#change_image_link').addClass("change_image");
    };

    var hideChangeImageLink = function() {
        $('#change_image_link').removeClass("change_image");
        $('#change_image_link').addClass("change_image_link");
    };

    var updateBindings = function() {
        $('#profile_image').mouseover(showChangeImageLink);
        $('#profile_image').mouseout(hideChangeImageLink);
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
