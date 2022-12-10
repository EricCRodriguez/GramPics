// run when jquery loaded
$(function(){
  $("body").on("click", "#post-comment", function(){
    $("#comment_comment").focus();
  });

  $("body").on("click", ".post-like", function(){
    var post_id = $(this).data("id");

    $.ajax({
      url: "/post/like/"+post_id,
      method: "GET"
    });
  });

  // when user scrolls to bottom of feed, then load more posts and append to feed
  if($('.accounts.index').length > 0){
    $(window).on('scroll', function() {
      var scrollbar_position = $(this).scrollTop(),
          view_height = $(this).innerHeight(),
          page_height = $('body')[0].scrollHeight,
          total_posts_loaded = $("#feed .insta-post").length,
          skip_request = $("#no-more-posts").length > 0;

      if(!skip_request && (scrollbar_position + view_height >= page_height)) {
        $.ajax({
          url: "feed/load",
          method: "GET",
          data: {
            "offset": total_posts_loaded
          }
        });
      }
    });
  }
});
