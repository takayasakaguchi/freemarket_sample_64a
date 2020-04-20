$(function(){
  //フォーム指定
  $("#charge-form").validate({
    //検証ルール設定
    rules: {
      card_number: {
        required: true,
        number: true,
        maxlength : 16,
        minlength : 16
        
      },
      security_code: {
        required: true,
        number: true,
        maxlength : 3,
        minlength : 3
       },
    },

    //エラーメッセージ設定
    messages: {
      card_number: {
        required: 'このフィールドは必須です',
        number: "半角数字のみ入力出来ます。",
        maxlength : "16桁の番号を入力してください",
        minlength : "16桁の番号を入力してください"
      },
      security_code: {
        required: 'このフィールドは必須です',
        number: "半角数字のみ入力出来ます。",
        maxlength : "3桁の番号を入力してください",
        minlength : "3桁の番号を入力してください"
      }, 
    },

    //エラーメッセージ出力箇所設定
    errorPlacement: function(error, element){
      if(element.attr("name")=="card_number")
      {
        error.insertAfter("#card_number_error");	
      }
      else if(element.attr("name")=="security_code")
      {
        error.insertAfter("#security_code_error");	
      }
      else{
        error.insertAfter(element);	
      }
    }

  });
});

