class PurchasesController < ApplicationController

  def index
    user = User.find(1) 
      #ログイン/ログアウトできないのでダミーデータを作ります
      
      
    @address = user.address
    @user = User.find(1) 
    
  end
  
end
