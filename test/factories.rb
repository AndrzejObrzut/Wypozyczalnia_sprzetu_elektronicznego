FactoryGirl.define do
  factory :user do
    user_name "test"
    password "password"
    first_name "Test"
    last_name "test2"
    email "test.pawlus@gmail.com"
    phone "123123123"
    birth_date '1994-08-09'
    regulations_accepted true

    factory :is_admin do
      is_admin  true
    end
  end

end
