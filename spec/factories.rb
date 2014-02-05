FactoryGirl.define do
  factory :user do
    name     "Philippe Tring"
    email    "philippetring@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end