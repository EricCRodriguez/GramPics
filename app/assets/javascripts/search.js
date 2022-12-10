$(function(){
  var search_request_timer;

  $("#search-box input").on("keyup", function(){
    var search_term = $(this).val();

    if(search_request_timer){
      clearTimeout(search_request_timer);
    }

    search_request_timer = setTimeout(function(){
      $.ajax({
        url: "/search",
        method: "GET",
        data: {
          "search": search_term
        }
      });
    }, 1000);
  });

  $("body").on("click", function(){
    var $results = $("#search-results");

    if( $results.text() != "" ){
        $results.val("").hide();
    }
  });
});
