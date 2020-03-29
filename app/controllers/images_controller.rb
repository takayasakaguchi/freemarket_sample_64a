class ImagesController < ApplicationController
  def toppage
    @images = image.all
end
