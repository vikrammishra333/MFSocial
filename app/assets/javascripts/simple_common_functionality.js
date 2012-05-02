$(document).ready(function(){


     var updateBindings = function() {
        textareaAutoGrow();
        timeagoFormat();
        clickLike();
        clickUnlike();
        showHideCommentPost();
     };

    var textareaAutoGrow = function() {
        $(".text_space").autoGrow();
     };

     var timeagoFormat = function(){
         $("abbr.timeago").timeago().css('border','0');
     };

     var clickLike = function() {
        $(".like_post_class").live("click", function(e){
            id = $(this).attr("id");
            $("#un"+id).removeClass("disable_link");
            $("#"+id).addClass("disable_link");
        });
     };

     var clickUnlike = function() {
        $(".unlike_post_class").live("click", function(e){
            id = $(this).attr("id");
            var required_id = id.substring(2);
            $("#"+required_id).removeClass("disable_link");
            $("#"+id).addClass("disable_link");
        });
     };


     var showHideCommentPost = function(){
        $('.comment_post_link').live("click", function(e){
            var id = $(this).attr("id");
            var comment_box_id = id.substring(id.lastIndexOf('_')+1);
            $('#comments_'+comment_box_id).toggle();
        });
     };

     
    $('body').bind('ajaxComplete', function() {

        updateBindings();

    });

    updateBindings();
});

function checkSubmit(e,id, current_element)
{
   if(e && e.keyCode == 13 )
   {
    if( $(current_element).val().trim() != "") {
      $('#'+id).submit();
    }
   } 
}

