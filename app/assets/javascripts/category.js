$(function(){
  $('.listLeft__item').hover(function(){
    $(this).addClass('active');
    var parent = $('.active').children('.parent-wrap');
    parent.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.parent-wrap').hide();
  });

  $('.parent').hover(function(){
    $(this).addClass('active');
    var children = $('.active').children('.child-wrap');
    children.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.child-wrap').hide();
  });

  $('.child').hover(function(){
    $(this).addClass('active');
    var grandChild = $('.active').children('.grand-child-wrap');
    grandChild.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.grand-child-wrap').hide();

  });
});