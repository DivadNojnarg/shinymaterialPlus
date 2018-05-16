// Check first if any of the task is checked
$('#task-card input:checkbox').each(function() {
  checkbox_check(this);
});
// Task check box
$('#task-card input:checkbox').change(function() {
  checkbox_check(this);
});
// Check Uncheck function
function checkbox_check(el){
    if (!$(el).is(':checked')) {
        $(el).next().css('text-decoration', 'none'); // or addClass            
    } else {
        $(el).next().css('text-decoration', 'line-through'); //or addClass
    }    
}
  
// table of content
$(document).ready(function(){
  $('.scrollspy').scrollSpy();
}); 
  
function getCollapseIndex() {
  $("#slide-out > li > ul > li > a.collapsible-header").each(function(index) {
    if ($(this).parent().hasClass('active')) {
      openIndex = index;
    }
  });
}
    
    
// Materialize Slider
$('.slider').slider({
  full_width: true
});





