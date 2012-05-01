// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs

$(document).ready(function(){
    
    var textarea_autogrow = function() {
        $(".text_space").autoGrow();
     };

     var timeago_format = function(){
         $("abbr.timeago").timeago().css('border','0');
     };

     var click_like = function() {
        $(".like_post_class").live("click", function(e){
            id = $(this).attr("id");
            $("#un"+id).removeClass("disable_link");
            $("#"+id).addClass("disable_link");
        });
     };

     var click_unlike = function() {
        $(".unlike_post_class").live("click", function(e){
            id = $(this).attr("id");
            var required_id = id.substring(2);
            $("#"+required_id).removeClass("disable_link");
            $("#"+id).addClass("disable_link");
        });
     };

     var updateBindings = function() {
        textarea_autogrow();
        timeago_format();
        click_like();
        click_unlike();
     };

     var initialize = function(){
        updateBindings();
     }

     initialize();
});

function checkSubmit(e)
{
   if(e && e.keyCode == 13)
   {
      document.forms[0].submit();
   }
}

