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
  
end
