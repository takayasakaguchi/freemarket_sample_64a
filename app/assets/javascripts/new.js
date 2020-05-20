$(function() {

  $("#product_price").on("keyup", function() {
    var priceBeforeTax = $("#product_price").val();
    var input = priceBeforeTax * 0.1;
    if (priceBeforeTax>=300&&priceBeforeTax<=999999999){
      $('.single-main__form1__text4__commission__from__boder').html('¥' + input);
    }else{
      $('.single-main__form1__text4__commission__from__boder').html("ー");
    }
  });
});

$(function() {

$("#product_price").on("keyup", function() {
    var priceBeforeTax = $("#product_price").val();
    var input = priceBeforeTax * 0.1;
    var Profit = priceBeforeTax - input;
    if (priceBeforeTax>=300&&priceBeforeTax<=999999999){
    $('.single-main__form1__text4__commission__from2__benefit__boder').html('¥' + Profit);
    }else{
      $('.single-main__form1__text4__commission__from2__benefit__boder').html("ー");
    }
  });
});

$(function() {

  $("#product_price").on("keyup", function() {
      var priceBeforeTax = $("#product_price").val();
      var input = priceBeforeTax * 0.1;
      var Profit = priceBeforeTax - input;
      if (priceBeforeTax>=300&&priceBeforeTax<=999999999){
      $('.single-main__form1__text4__commission__from0').html();
      }else{
        $('.single-main__form1__text4__commission__from0').html("300以上9999999以下で入力してください");
      }
    });
  });