$(function() {
  $(".form_user").on("keyword", function() {
    var input = $(".form_user").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
  });
});