function switch_highlight(element){
  $('div.highlighted').removeClass('highlighted')
  $(element).parents('div:first').addClass('highlighted')
}

$(document).ready(function(){
  $('a.display').click(function(){
    div = 'div#' + $(this).attr('class')
    $('div.type').not($(this)).hide('slide')
    $(div).show('slide')
    console.log($(this).attr('class'))
  })
  
  $('div.type input').focus(function(){
    switch_highlight(this)
  })
  
  
  $('a.display').removeClass('display')
})