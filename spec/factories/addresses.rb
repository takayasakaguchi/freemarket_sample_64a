FactoryBot.define do

  factory :address do

    first_name              {"山田"}
    last_name               {"太郎"}
    first_name_reading      {"ヤマダ"}
    last_name_reading       {"タロウ"}
    postal_code             {"123-4567"}
    prefecture_id           {1}
    city                    {"札幌市"}
    house_number            {"旭ヶ丘"}
    building_name           {"旭ヶ丘マンション"}
    phone_number            {"08012345678"}
    user
  end

end
