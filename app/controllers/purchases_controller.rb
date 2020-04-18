class PurchasesController < ApplicationController

  require "payjp"

  def index
    @address = User.find(1).address 
    @product = Product.find(1)

    #クレジットカード登録済みの場合、登録内容を表示する
   
    card = current_user.credit_card
      # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる（ダミーユーザーのカード）

    if card.blank?
      render action: :index 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] #payjpの秘密鍵をセット。

      customer = Payjp::Customer.retrieve(card.customer_id)
        #保管した顧客IDでpayjpから情報取得
      @customer_card = customer.cards.retrieve(card.card_id)
        #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入

        #保管されているブランドによって表示させる画像を変更する
      @card_brand = @customer_card.brand      
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.png"
      when "MasterCard"
        @card_src = "master-card.png"
      when "American Express"
        @card_src = "american_express.png"
      when "Diners Club"
        @card_src = "dinersclub.png"
      when "Discover"
        @card_src = "discover.png"
      when "Saison"
        @card_src = "saison-card.png"
      end

    end
  end

end
