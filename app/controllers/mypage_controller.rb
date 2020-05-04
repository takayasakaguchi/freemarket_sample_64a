class MypageController < ApplicationController
  def index
    @parents = Category.roots.all
  end
end
