class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # validation変数設定
  VALID_NAME_KANJI_REGEX = /\A[一-龥]+\z/
  VALID_NAME_KANA_REGEX = /\A([ァ-ン]|ー)+\z/
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/
  VALID_CITY_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_PHONE_NUMBER_REGEX = /\A\d{11}\z/

  # 姓（漢字）
  validates :first_name,
    presence: true,
    length: { maximum: 5, message: "文字数オーバーです", allow_blank: true},
    format: {with: VALID_NAME_KANJI_REGEX, message: "は漢字で入力してください", allow_blank: true}

  # 名（漢字）
  validates :last_name,
    presence: true,
    length: { maximum: 5, message: "文字数オーバーです", allow_blank: true},
    format: {with: VALID_NAME_KANJI_REGEX, message: "は漢字で入力してください", allow_blank: true}

  # 姓（カナ）
  validates :first_name_reading,
    presence: true,
    length: { maximum: 8, message: "文字数オーバーです", allow_blank: true},
    format: {with: VALID_NAME_KANA_REGEX, message: "は全角カタカナで入力してください", allow_blank: true}

  # 名（カナ）
  validates :last_name_reading,
    presence: true,
    length: { maximum: 8, message: "文字数オーバーです", allow_blank: true},
    format: {with: VALID_NAME_KANA_REGEX, message: "は全角カタカナで入力してください", allow_blank: true}

  # 郵便番号
  validates :postal_code,
    presence: true,
    format: {with: VALID_POSTAL_CODE_REGEX, message: "は無効です", allow_blank: true}
  
  # 市区町村
  validates :city, 
    presence: true,
    format: {with: VALID_CITY_REGEX, message: "名が無効です"}

  # 番地
  validates :house_number, presence: true

  # 電話番号
  validates :phone_number,
    allow_blank: true,
    format: {with: VALID_PHONE_NUMBER_REGEX, message: "はハイフンなし11桁で記入してください"}

  # アソシエーション
  belongs_to_active_hash :prefecture
  belongs_to :user

end
