# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    secret_text "MyText"
    user_id 1
  end
end
