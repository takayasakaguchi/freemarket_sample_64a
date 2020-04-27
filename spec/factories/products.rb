FactoryBot.define do
  factory :product do
    name                  {"AAA"}
    description           {"商品の説明"}
    category_id           {5}
    size                  {"AAA"}
    brand                 {"AAA"}
    status                {"AAA"}
    postage               {"AAA"}
    prefecture_id         {1}
    lead_time             {"AAA"}
    price                 {1000}
    after(:build) do |product|
      product.images << FactoryBot.create(:image)
    end
    user                  { FactoryBot.create(:user) }
    category              { FactoryBot.create(:category) }
  end
end
