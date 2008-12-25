$(document).ready(function(){
  $('div.things li').click(function(){
    location.href = $(this).children('a:first').attr('href')
  })
})