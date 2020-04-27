class ImagesController < ApplicationController
  belongs_to :product, optional: true
end
