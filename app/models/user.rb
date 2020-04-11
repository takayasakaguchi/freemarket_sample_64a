class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :comments
  has_many :likes
  has_many :purchases
  has_one :credit_card
  has_one :address

  # accepts_nested_attributes_for :address

  VALID_NAME_KANJI_REGEX = /\A[一-龥]+\z/
  VALID_NAME_KANA_REGEX = /\A([ァ-ン]|ー)+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/

  # ニックネーム
  validates :nickname,
    presence: true,
    length: { maximum: 8, message: "文字数オーバーです", allow_blank: true}
    
  # メールアドレス
  validates :email,
    presence: true,
    uniqueness: true,
    format: {with: VALID_EMAIL_REGEX}

  # パスワード
  validates :password,
    presence: true,
    confirmation: true,
    length: { maximum: 7, message: "文字数オーバーです", allow_blank: true},
    format: {with: VALID_PASSWORD_REGEX, message: "は半角英数字で入力してください", allow_blank: true}
  
  # 姓（漢字）
  validates :first_name,
    presence: true,
    length: { maximum: 8, message: "文字数オーバーです", allow_blank: true},
    format: {with: VALID_NAME_KANJI_REGEX, message: "は漢字で入力してください", allow_blank: true}

  # 名（漢字）
  validates :last_name,
    presence: true,
    length: { maximum: 8, message: "文字数オーバーです", allow_blank: true},
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

    validates :year,
      presence: true

    validates :month,
      presence: true

    validates :day,
      presence: true

end
