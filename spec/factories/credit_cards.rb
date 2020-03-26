FactoryBot.define do
  factory :credit_card do
    user_id { 1 }
    card_number { 1 }
    due_year { 1 }
    due_month { 1 }
    security_code { 1 }
  end
end
