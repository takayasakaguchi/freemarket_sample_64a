require 'rails_helper'
describe User do
  describe '#create' do

  # ニックネーム
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicnameが8文字以上である場合は登録できないこと" do
      user = build(:user, nickname: "abeabeabe")
      user.valid?
      expect(user.errors[:nickname]).to include("文字数オーバーです")
     end

  # email
     it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it " 重複したemailが存在しなければ登録できること " do
      user = build(:user, email: "kkk@gmail.com")
      user.valid?
      expect(user.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) 
    end

# パスワード
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが半角英数字である場合は登録できること" do
      user = build(:user, password: "abc01")
      user.valid?
      expect(user.password).to match(/\A[a-z0-9]+\z/) 
    end

    # 姓（漢字）について

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
     end
 
     it "first_nameが5文字以下である場合は登録できること" do
      user = build(:user, first_name: "山田山田山")
      expect(user).to be_valid
     end
 
     it "first_nameが8文字以上である場合は登録できないこと" do
      user = build(:user, first_name: "山田山田山田山田山田")
      user.valid?
      expect(user.errors[:first_name]).to include("文字数オーバーです")
     end
 
     it "first_nameが漢字である場合は登録できること" do
       user = build(:user, first_name: "山田")
       user.valid?
       expect(user.first_name).to match(/\A[一-龥]+\z/) 
      end
 
     it "first_nameが漢字でない場合は登録できないこと" do
       user = build(:user, first_name: "やまだ")
       user.valid?
       expect(user.errors[:first_name]).to include("は漢字で入力してください")
      end
 
   # 名（漢字）について
 
     it "last_nameがない場合は登録できないこと" do
       user = build(:user, last_name: "")
       user.valid?
       expect(user.errors[:last_name]).to include("を入力してください")
     end
 
     it "last_nameが8文字以下である場合は登録できること" do
       user = build(:user, last_name: "太郎太郎太")
       expect(user).to be_valid
     end
 
     it "last_nameが8文字以上である場合は登録できないこと" do
       user = build(:user, last_name: "太郎太郎太郎太郎太郎")
       user.valid?
       expect(user.errors[:last_name]).to include("文字数オーバーです")
     end
 
     it "last_nameが漢字である場合は登録できること" do
       user = build(:user, last_name: "太郎")
       user.valid?
       expect(user.last_name).to match(/\A[一-龥]+\z/) 
     end
 
     it "last_nameが漢字でない場合は登録できないこと" do
       user = build(:user, last_name: "たろう")
       user.valid?
       expect(user.errors[:last_name]).to include("は漢字で入力してください")
     end
 
   # 姓（カナ）について
 
     it "first_name_readingがない場合は登録できないこと" do
       user = build(:user, first_name_reading: "")
       user.valid?
       expect(user.errors[:first_name_reading]).to include("を入力してください")
     end
 
     it "first_name_readingが8文字以下である場合は登録できること" do
       user = build(:user, first_name_reading: "タロウタロウタロ")
       expect(user).to be_valid
     end
 
     it "first_name_readingが9文字以上である場合は登録できないこと" do
       user = build(:user, first_name_reading: "タロウタロウタロウ")
       user.valid?
       expect(user.errors[:first_name_reading]).to include("文字数オーバーです")
     end
 
     it "first_name_readingが全角カタカナである場合は登録できること" do
       user = build(:user, first_name_reading: "タロウ")
       user.valid?
       expect(user.first_name_reading).to match(/\A([ァ-ン]|ー)+\z/) 
     end
 
     it "first_name_readingが全角カタカナでない場合は登録できないこと" do
       user = build(:user, first_name_reading: "たろう")
       user.valid?
       expect(user.errors[:first_name_reading]).to include("は全角カタカナで入力してください")
     end
 
   # 名（カナ）について
 
     it "last_name_readingがない場合は登録できないこと" do
       user = build(:user, last_name_reading: "")
       user.valid?
       expect(user.errors[:last_name_reading]).to include("を入力してください")
     end
 
     it "last_name_readingが8文字以下である場合は登録できること" do
       user = build(:user, last_name_reading: "タロウタロウタロ")
       expect(user).to be_valid
     end
 
     it "last_name_readingが9文字以上である場合は登録できないこと" do
       user = build(:user, last_name_reading: "タロウタロウタロウ")
       user.valid?
       expect(user.errors[:last_name_reading]).to include("文字数オーバーです")
     end
 
     it "last_name_readingが全角カタカナである場合は登録できること" do
       user = build(:user, last_name_reading: "タロウ")
       user.valid?
       expect(user.last_name_reading).to match(/\A([ァ-ン]|ー)+\z/) 
     end
 
     it "last_name_readingが全角カタカナでない場合は登録できないこと" do
       user = build(:user, last_name_reading: "たろう")
       user.valid?
       expect(user.errors[:last_name_reading]).to include("は全角カタカナで入力してください")
     end
 
# 生年月日
    it "yearがない場合は登録できないこと" do
      user = build(:user, year: "")
      user.valid?
      expect(user.errors[:year]).to include("を入力してください")
     end

     it "monthがない場合は登録できないこと" do
      user = build(:user, month: "")
      user.valid?
      expect(user.errors[:month]).to include("を入力してください")
     end

     it "dayがない場合は登録できないこと" do
      user = build(:user, day: "")
      user.valid?
      expect(user.errors[:day]).to include("を入力してください")
     end
  end
end