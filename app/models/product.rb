class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy, inverse_of: :product
  has_many :likes
  has_many :comments
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates_associated :images
  validates :images,
    presence: { message: "を投稿してください"}

  validates :name,
    presence: true,
    length: { maximum: 40, message: "文字数オーバーです", allow_blank: true}

  validates :description,
    presence: true,
    length: { maximum: 1000, message: "文字数オーバーです", allow_blank: true}

  validates :category_id,
    presence: { message: "まで入力してください"}
  
  validates :status,
    presence: { message: "を選択してください"}

  validates :postage,
    presence: { message: "を選択してください"}

  validates :prefecture_id,
    presence: { message: "を選択してください"}

  validates :lead_time,
    presence: { message: "を選択してください"}

  validates :price,
    presence: true,
    numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は¥300 ~ ¥9,999,999です", allow_blank: true}
end

