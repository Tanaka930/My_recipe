$(function() {

  var search_list = $(".users-items-box");
  function appendUser(user) {
    var html = `<div class="users-all-items">
                <div class="user-left">
                  <div class:"users-items-box">
                  <a href="/user/${user.id}">${user.name}</a>
                  </div>
                </div>
                <div class="user-right">
                  ${user.name}
                </div>
              </div>
              `
    search_list.append(html);
  }
        
  $(".search-form").on("keyup", function() {
    var input = $(".search-form").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users) {
      search_list.empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else {
        appendErrMsgToHTML("一致するユーザーがいません");
      }
    })
  });
});
