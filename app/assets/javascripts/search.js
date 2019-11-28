$(function() {
  $("#submit").on("click", function() {
    let input = $("#keyword").val();
    $("#result").text(input);
  });
});