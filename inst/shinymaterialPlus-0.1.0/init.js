$(function () {
  Shiny.addCustomMessageHandler('shinymaterialJS', function(code) {
    //console.log(code.split('\\\\').join('').trim());
    eval(code.split('\\\\').join('').trim());
  });
});