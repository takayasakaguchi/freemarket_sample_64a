class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :likes
  has_many :purchases
  has_many :comments
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :images, allow_destroy: true


  validates :name,
    presence: true,
    length: { maximum: 40, message: "文字数オーバーです", allow_blank: true}

  validates :description,
    presence: true,
    length: { maximum: 1000, message: "文字数オーバーです", allow_blank: true}

  validates :category_id,
    presence: true

  validates :status,
    presence: true

  validates :postage,
    presence: true

  validates :prefecture_id,
    presence: true

  validates :lead_time,
    presence: true

  validates :price,
    presence: true,
    numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
