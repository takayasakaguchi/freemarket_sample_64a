class CreditCardController < ApplicationController

  require "payjp"

  def new

  end

  def registration #payjpとCardのデータベース作成を実施します。(カード登録)
    
    user = User.find(1) #ログイン/ログアウトできないのでダミーデータを作ります。

    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] #payjpの公開鍵をセット。
    if params['payjpToken'].blank?
      # paramsの中にjsで作った'payjpTokenが存在するか確かめる
      redirect_to action: "new"
    else
      # binding.pry
      customer = Payjp::Customer.create(
      # description: '登録テスト', #なくてもOK
      # email: user.email, #なくてもOK
      card: params['payjpToken'],
      metadata: {user_id: user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK?
      # ↑ここ(else以降)でjay.jpに保存

      @card = CreditCard.new(user_id: user.id, customer_id: customer.id, card_id: customer.default_card)
      # ↑ ここでdbのCreditCardテーブルに「user_id」、「customer_id」、「card_id」を保存

      if @card.save
        redirect_to action: "new"
      # else
      #   redirect_to action: "pay"
      end
    end
  end

  def buy #購入機能

    if card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(1)
     # 購入した際の情報を元に引っ張ってくる
     # ダミーデータを使用します

      user = User.find(1) #ログイン/ログアウトできないのでダミーデータを作ります
      card = user.credit_card
     # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる

      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
     # キーをセットする

      Payjp::Charge.create(
      amount: @product.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる

      if @product.update(status: 1, buyer_id: user.id)
        flash[:notice] = '購入しました。'
        redirect_to controller: "posts", action: 'toppage'
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "purchase", action: 'index'
      end
     #↑この辺はこちら側のテーブル設計どうりに色々しています
    end
  end
  
end
