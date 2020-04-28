FactoryBot.define do
  factory :image do
    image                 { File.new("#{Rails.root}/spec/fixtures/魚.jpeg") }
    product_id            {1}
  end
end
