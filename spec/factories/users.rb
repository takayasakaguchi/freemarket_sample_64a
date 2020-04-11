FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_reading    {"ヤマダ"}
    last_name_reading     {"タロウ"}
    year                  {"0"}
    month                 {"0"}
    day                   {"0"}
  end
end
