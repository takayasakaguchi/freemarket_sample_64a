class PurchasesController < ApplicationController

  require "payjp"

  def index
    @product = Product.find(1)

    #クレジットカード登録済みの場合、登録内容を表示する
    user = User.find(1) 
      #ログイン/ログアウトできないのでダミーデータを作ります
    card = user.credit_cards.first
      # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる（ダミーユーザーのカード）

    if card.blank?
      render action: :index 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] #payjpの秘密鍵をセット。

      customer = Payjp::Customer.retrieve(card.customer_id)
        #保管した顧客IDでpayjpから情報取得
      @customer_card = customer.cards.retrieve(card.card_id)
        #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    end

  end

end
