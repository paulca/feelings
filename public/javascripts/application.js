function highlight(element){
  $('div.highlighted').removeClass('highlighted')
  $(element).parents('div:first').addClass('highlighted')
}

function unhighlight(element){
  $(element).parents('div:first').removeClass('highlighted')
}

$(document).ready(function(){
  $('a.display').click(function(){
    div = 'div#' + $(this).attr('class')
    $('div.type').not($(this)).hide()
    $(div).show()
    $('div.first').addClass('highlighted')
    if($(div).find('div.highlighted textarea').length > 0)
    {
      $(div).find('div.highlighted textarea:first').focus()
    }
    if($(div).find('div.highlighted input').length > 0)
    {
      $(div).find('div.highlighted input:first').focus()
    }
    $('div#posts').hide()
  })
  
  $('div.type input, div.type textarea').focus(function(){
    highlight(this)
  })
  
  $('div.type input, div.type textarea').blur(function(){
    unhighlight(this)
  })
  
  $('a.cancel').click(function(){
    $('div.type').hide()
    $('div#posts').show()
    return false;
  })
  
  // $('div.type div').click(function(){
  //   highlight(this)
  // })
  
  
  $('a.display').removeClass('display')
})