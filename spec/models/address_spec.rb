require 'rails_helper'
describe Address do
  describe '#create' do

  # 姓（漢字）について

    it "first_nameがない場合は登録できないこと" do
     address = build(:address, first_name: "")
     address.valid?
     expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "first_nameが5文字以下である場合は登録できること" do
     binding.pry
     address = build(:address, first_name: "山田山田山")
     expect(address).to be_valid
    end

    it "first_nameが6文字以上である場合は登録できないこと" do
     address = build(:address, first_name: "山田山田山田")
     address.valid?
     expect(address.errors[:first_name]).to include("文字数オーバーです")
    end

    it "first_nameが漢字である場合は登録できること" do
      address = build(:address, first_name: "山田")
      address.valid?
      expect(address.first_name).to match(/\A[一-龥]+\z/) 
     end

    it "first_nameが漢字でない場合は登録できないこと" do
      address = build(:address, first_name: "やまだ")
      address.valid?
      expect(address.errors[:first_name]).to include("は漢字で入力してください")
     end

  # 名（漢字）について

    it "last_nameがない場合は登録できないこと" do
      address = build(:address, last_name: "")
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    it "last_nameが5文字以下である場合は登録できること" do
      address = build(:address, last_name: "太郎太郎太")
      expect(address).to be_valid
    end

    it "last_nameが6文字以上である場合は登録できないこと" do
      address = build(:address, last_name: "太郎太郎太郎")
      address.valid?
      expect(address.errors[:last_name]).to include("文字数オーバーです")
    end

    it "last_nameが漢字である場合は登録できること" do
      address = build(:address, last_name: "太郎")
      address.valid?
      expect(address.last_name).to match(/\A[一-龥]+\z/) 
    end

    it "last_nameが漢字でない場合は登録できないこと" do
      address = build(:address, last_name: "たろう")
      address.valid?
      expect(address.errors[:last_name]).to include("は漢字で入力してください")
    end

  # 姓（カナ）について

    it "first_name_readingがない場合は登録できないこと" do
      address = build(:address, first_name_reading: "")
      address.valid?
      expect(address.errors[:first_name_reading]).to include("を入力してください")
    end

    it "first_name_readingが8文字以下である場合は登録できること" do
      address = build(:address, first_name_reading: "タロウタロウタロ")
      expect(address).to be_valid
    end

    it "first_name_readingが9文字以上である場合は登録できないこと" do
      address = build(:address, first_name_reading: "タロウタロウタロウ")
      address.valid?
      expect(address.errors[:first_name_reading]).to include("文字数オーバーです")
    end

    it "first_name_readingが全角カタカナである場合は登録できること" do
      address = build(:address, first_name_reading: "タロウ")
      address.valid?
      expect(address.first_name_reading).to match(/\A([ァ-ン]|ー)+\z/) 
    end

    it "first_name_readingが全角カタカナでない場合は登録できないこと" do
      address = build(:address, first_name_reading: "たろう")
      address.valid?
      expect(address.errors[:first_name_reading]).to include("は全角カタカナで入力してください")
    end

  # 名（カナ）について

    it "last_name_readingがない場合は登録できないこと" do
      address = build(:address, last_name_reading: "")
      address.valid?
      expect(address.errors[:last_name_reading]).to include("を入力してください")
    end

    it "last_name_readingが8文字以下である場合は登録できること" do
      address = build(:address, last_name_reading: "タロウタロウタロ")
      expect(address).to be_valid
    end

    it "last_name_readingが9文字以上である場合は登録できないこと" do
      address = build(:address, last_name_reading: "タロウタロウタロウ")
      address.valid?
      expect(address.errors[:last_name_reading]).to include("文字数オーバーです")
    end

    it "last_name_readingが全角カタカナである場合は登録できること" do
      address = build(:address, last_name_reading: "タロウ")
      address.valid?
      expect(address.last_name_reading).to match(/\A([ァ-ン]|ー)+\z/) 
    end

    it "last_name_readingが全角カタカナでない場合は登録できないこと" do
      address = build(:address, last_name_reading: "たろう")
      address.valid?
      expect(address.errors[:last_name_reading]).to include("は全角カタカナで入力してください")
    end

  # 郵便番号について

    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "postal_codeが「ハイフンあり・なし両方」を満たす場合は登録できること" do
      address = build(:address, postal_code: "123-4567")
      address.valid?
      expect(address.postal_code).to match(/\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/) 
    end

    it "postal_codeが「ハイフンあり・なし両方」を満たさない場合は登録できないこと" do
      address = build(:address, postal_code: "1234-5678")
      address.valid?
      expect(address.errors[:postal_code]).to include("は無効です")
    end

   # 市区町村について   

    it "cityがない場合は登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    # it "cityが10文字以下である場合は登録できること" do
    #   address = build(:address, city: "札幌市札幌市中央区区")
    #   expect(address).to be_valid
    # end

    # it "cityが11文字以上である場合は登録できないこと" do
    #   address = build(:address, city: "札幌市札幌市市中央区区")
    #   address.valid?
    #   expect(address.errors[:city]).to include("文字数オーバーです")
    # end

    it "cityが「全角ひらがな、全角カタカナ、漢字」を満たす場合は登録できること" do
      address = build(:address, city: "さっぽろ市チュウオウ区")
      address.valid?
      expect(address.city).to match(/\A[ぁ-んァ-ン一-龥]/) 
    end

    it "cityが「全角ひらがな、全角カタカナ、漢字」を満たさない場合は登録できないこと" do
      address = build(:address, city: "sapporo市チュウオウ区")
      address.valid?
      expect(address.errors[:city]).to include("名が無効です")
    end

   # 番地について

    it "house_numberがない場合は登録できないこと" do
      address = build(:address, house_number: "")
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end

   # 電話番号について

    it "phone_numberが「ハイフンなし11桁」を満たす場合は登録できること" do
      address = build(:address, phone_number: "08012345678")
      address.valid?
      expect(address.phone_number).to match(/\A\d{11}\z/) 
    end

    it "phone_numberが「ハイフンなし11桁」を満たさない場合は登録できないこと" do
      address = build(:address, phone_number: "080123456788")
      address.valid?
      expect(address.errors[:phone_number]).to include("はハイフンなし11桁で記入してください")
    end

  end
end
