$(document).ready(function(){

    var updateBindings = function() {
        imageHover();
    };

    var showPopup = function() {
        alert('clicked');
    };

    var imageHover = function(){
        $('#profile_image').live("mouseover", function(){
            $("#change_image_link").removeClass("change_image_link");
            $("#change_image_link").addClass("change_image_link_visible");
        });
        $('#profile_image').live("mouseout", function(){
            $("#change_image_link").removeClass("change_image_link_visible");
            $("#change_image_link").addClass("change_image_link");
        });
    };


    $('body').bind('ajaxComplete', function() {

        updateBindings();
        
    });

    updateBindings();
});
