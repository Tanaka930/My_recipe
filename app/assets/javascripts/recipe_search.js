$(function() {
  $(".form-control.mr-sm-2").on("keyup", function() {
    var input = $(".form-control.mr-sm-2")
    $.ajax({
      type: 'GET',
      url: '/recipes/show',
      data: { keyword: input },
      dataType: 'json'
    })
  })
})

