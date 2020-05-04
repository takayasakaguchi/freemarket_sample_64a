class LogoutController < ApplicationController
  def index  # indexアクションを定義した
    @parents = Category.roots
  end
end
