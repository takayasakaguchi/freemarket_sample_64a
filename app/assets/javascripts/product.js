$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="upload-image">
                    <input class="upload-image" type="file"
                    name="product[images_attributes][${index}][src]"
                    id="product_images_attributes_${index}_src"><br>
                  </div>`;
    return html;
  }
    // プレビュー用のimgタグを生成する関数
    const buildImg = (index, url)=> {
      const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
      return html;
    }


  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  
  $('#image-box').on('change', '.upload-image', function(e) {
     // プレビュー用のimgタグを生成する関数
    const targetIndex = $(this).parent().data('index');
    
    console.log(e.target.files[0])
    var file = e.target.files[0];

    // ファイルのブラウザ上でのURLを取得する
    var blobUrl = window.URL.createObjectURL(file);
    $('#previews').append(buildImg(targetIndex, blobUrl));
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));

    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});