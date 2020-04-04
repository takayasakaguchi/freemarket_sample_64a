$(function(){
  /** jQueryの処理 */
  var form = $("#submit_btn");
  //↑「form」という変数を設定する（#submit_btn: 登録ボタンのID）
  
    Payjp.setPublicKey("pk_test_0184a51888153a807ac3fd3f");
    //↑まずはテスト鍵（公開鍵）をセットする
  
    $("#submit_btn").on("click",function(e){
    //↑登録ボタンを押してイベント発火
      e.preventDefault();
      $("#charge-form").valid();
    //↑ここでrailsの処理を止めることでjsの処理を行う
      var card = {
      // ↑「card」という変数を設定する
        number: $("#card_number").val(),
        //↑「card_number」の入力情報を取得
  
        cvc: $("#card_cvc").val(),
        //↑「card_cvc（セキュリティーコード）」の入力情報を取得
  
        exp_month: $("#card_month").val(),
        //↑「card_month（有効期限月）」の入力情報を取得
  
        exp_year: $("#card_year").val()
        //↑「card_year（有効期限年）」の入力情報を取得
      };
      console.log(card)
     //↑Pay.jpに登録するデータを準備する
      Payjp.createToken(card,function(status,response){
     //↑先ほどのcard情報がトークンという暗号化したものとして返ってくる
        form.find("input[type=submit]").prop("disabled", true);
  
        if(status == 200){//←うまくいった場合200になるので（成功した場合）
          $("#card_number").removeAttr("name");
          $("#card_cvc").removeAttr("name");
          $("#card_month").removeAttr("name");
          $("#card_year").removeAttr("name");
         //↑このremoveAttr("name")はデータを保持しないように消している
  
          var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
          //↑「payjphtml」という変数を設定する
          form.append(payjphtml);
          //↑これはdbにトークンを保存するのでjsで作ったトークンをセットしてる
          //formの真下にpayjphtmlを追加、``の情報がviewファイルセットされる。（type="hidden"なので見えない）
          
          document.inputForm.submit();
          //↑そしてここでsubmit！！これでrailsのアクションにいく！もちろん上でトークンをセットしているのでparamsの中には{payjpToken="トークン"}という情報が入っている
          
        }else{
          alert("カード情報が正しくありません。\n入力必須項目をご確認ください。\nカード有効期限をご確認ください。 ");
        }
      });
    });
});