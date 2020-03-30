class PurchasesController < ApplicationController

  def index
    @product = Product.find(1)
  end
  
end
