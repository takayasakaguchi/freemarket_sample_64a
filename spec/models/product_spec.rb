require 'rails_helper'
describe Product do
  describe '#create' do

  # 全ての必須項目

    it "全ての必須項目が入力されている場合出品できる" do
      product = FactoryBot.build(:product)
      expect(product).to be_valid
    end

  # 商品名について

    it "nameが40文字以下である場合は登録できること" do
     product = build(:product, name: "a" * 40)
     expect(product).to be_valid
    end

    it "nameが41文字以上である場合は登録できないこと" do
     product = build(:product, name: "a" * 41)
     product.valid?
     expect(product.errors[:name]).to include("文字数オーバーです")
    end

  # 商品説明について

    it "descriptionが1000文字以下である場合は登録できること" do
     product = build(:product, description: "a" * 1000)
     expect(product).to be_valid
    end

    it "descriptionが1001文字以上である場合は登録できないこと" do
     product = build(:product, description: "a" * 1001)
     product.valid?
     expect(product.errors[:description]).to include("文字数オーバーです")
    end

  # カテゴリーについて

    it "category_idがない場合は登録できないこと" do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("まで入力してください")
    end

  # 商品の状態について
  
    it "statusがない場合は登録できないこと" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("を選択してください")
    end
    
  # 送料の負担について
    
    it "postageがない場合は登録できないこと" do
      product = build(:product, postage: "")
      product.valid?
      expect(product.errors[:postage]).to include("を選択してください")
    end
    
  # 発送元の地域について
    
    it "prefecture_idがない場合は登録できないこと" do
      product = build(:product, prefecture_id: "")
      product.valid?
      expect(product.errors[:prefecture_id]).to include("を選択してください")
    end
  
  # 発送までの日数について
    
    it "lead_timeがない場合は登録できないこと" do
      product = build(:product, lead_time: "")
      product.valid?
      expect(product.errors[:lead_time]).to include("を選択してください")
    end
    
  # 販売価格について

    it "priceがない場合は登録できないこと" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "priceが¥299以下である場合は登録できないこと" do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("は¥300 ~ ¥9,999,999です")
    end

    it "priceが¥300以上である場合は登録できること" do
      product = build(:product, price: 300)
      expect(product).to be_valid
    end

    it "priceが¥10,000,000以上である場合は登録できないこと" do
      product = build(:product, price: 10000000)
      product.valid?
      expect(product.errors[:price]).to include("は¥300 ~ ¥9,999,999です")
    end

    it "priceが¥9,999,999以下である場合は登録できること" do
      product = build(:product, price: 9999999)
      expect(product).to be_valid
    end

  end
end
