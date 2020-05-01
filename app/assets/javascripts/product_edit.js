$(function(){
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <div class="input-area_edit">
                      <input class="js-file" type="file"
                      name="product[images_attributes][${num}][image]"
                      id="product_images_attributes_${num}_image">
                      <label for="product_images_attributes_${num}_image">画像を追加/編集</label>
                      <span class="js-remove_new">削除</span>
                    </div>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" class="uploaded_img">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10,11,12,13];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

// 既存画像用フォーム

  $('#image-box_edit').on('change', '.img-file', function(e) {
    const targetIndex = $(this).parent().parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('.uploaded_images').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box__container_edit').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box_edit').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().parent().data('index');
    
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
  
  });

// 新規投稿フォーム

  $('#image-box_edit').on('change', '.js-file', function(e) {
    const targetIndexNew = $(this).parent().parent().data('index');
    console.log($('.input-area_edit').length)
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndexNew}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else if ($('.input-area_edit').length <= 10){  // 新規画像追加の処理 画像が１０枚の場合は投稿不可
      $('.uploaded_images').append(buildImg(targetIndexNew, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box__container_edit').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    } 
  });
  
  $('#image-box_edit').on('click', '.js-remove_new', function() {
    const targetIndexNew = $(this).parent().parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndexNew}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndexNew}"]`).remove();
  });
});