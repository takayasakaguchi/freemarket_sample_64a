class PurchasesController < ApplicationController

  def index
    @address = User.find(1).address 
  end
  
end
