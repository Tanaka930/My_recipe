$(function() {
  $(".search-form").on("keyup", function() {
    var input = $(".search-form").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
  });
});