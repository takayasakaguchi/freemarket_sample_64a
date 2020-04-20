$(function(){

  // 「カテゴリーボタン」にカーソルを当てた際にドロップダウンボックスを展開
  $('.listLeft__item').hover(function(){

    /// 「カテゴリーボタン」にカーソルを当てた際にactiveクラスを付与、.parent-wrapを表示させる
    $(this).addClass('active');
    var parent = $('.active').children('.parent-wrap');
    parent.show();

  },function(){

    //// ドロップダウンボックからカーソルを外すとactiveクラスを削除、.parent-wrapを非表示にする
    $(this).removeClass('active');
    $(this).children('.parent-wrap').hide();
  });

  // 「親カテゴリー」にカーソルを当てた際にドロップダウンボックスを展開
  $('.parent').hover(function(){

    /// 「親カテゴリー」にカーソルを当てた際にactiveクラスを付与、.child-wrapを表示させる
    $(this).addClass('active');
    var children = $('.active').children('.child-wrap');
    children.show();

  },function(){

    //// 子ドロップダウンボックからカーソルを外すとactiveクラスを削除、.child-wrapを非表示にする
    $(this).removeClass('active');
    $(this).children('.child-wrap').hide();
  });

  // 「子カテゴリー」にカーソルを当てた際にドロップダウンボックスを展開
  $('.child').hover(function(){

    /// 「子カテゴリー」にカーソルを当てた際にactiveクラスを付与、.grand-child-wrapを表示させる
    $(this).addClass('active');
    var grandChild = $('.active').children('.grand-child-wrap');
    grandChild.show();

  },function(){
    //// 孫ドロップダウンボックからカーソルを外すとactiveクラスを削除、.child-wrapを非表示にする
    $(this).removeClass('active');
    $(this).children('.grand-child-wrap').hide();

  });
});