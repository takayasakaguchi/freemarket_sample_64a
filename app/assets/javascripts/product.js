$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="upload-image" type="file"
                    name="product[images_attributes][${index}][image]"
                    id="product_images_attributes_${index}_image"><br>
                  </div>`;
    return html;
  }
    // プレビュー用のimgタグを生成する関数
  //   const buildImg = (index, url)=> {
  //     const html = `<div class='image_box'>
  //                     <img data-index="${index}" src="${url}" width="100px" height="100px">
  //                     <div class='item-image__operetion--delete'>削除</div>
  //                   </div>`;
  //     return html;
  //   }
  // $(document).on("click", '.item-image__operetion--delete', function(){
  //   //プレビュー要素を取得
  //   var target_image = $(this).parent()
  //   //プレビューを削除
  //   target_image.remove();
  //   //inputタグに入ったファイルを削除
  //   file_field.val("")
  // })


  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  
  $('#image-box').on('change', '.upload-image', function(e) {
     // プレビュー用のimgタグを生成する関数
    // const targetIndex = $(this).parent().data('index');
    
    // console.log(e.target.files[0])
    // var file = e.target.files[0];

    // ファイルのブラウザ上でのURLを取得する
    // var blobUrl = window.URL.createObjectURL(file);
    // $('#previews').append(buildImg(targetIndex, blobUrl));
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    // $('#image-box').attr('class', `item-num-${num}`)

    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});