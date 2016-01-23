FactoryGirl.define do
  factory :user do
    user_name               "test"
    password                "password"
    first_name              "Test"
    last_name               "test2"
    email                   "test.pawlus@gmail.com"
    phone                   "123123123"
    birth_date              '1994-08-09'
    regulations_accepted    true

    factory :is_admin do
      is_admin  true
    end
  end

  factory :announcement_category do
    name          "Category_name"
    image         100101010101010101
    filename      "Category_name.png"
    mime_type     "image/png"
    size          108
  end

  factory :announcement do
    association               :announcement_category
    association               :user
    title                     "Test"
    description               "test2  est2 est2"
    price_per_hour            15
    price_per_day             100
  end

  factory :photos do
    association         :announcement
    image_file_tag      "5913360612_3.jpg"
    image_content_type  "image/jpeg"
    image_file_size     "70183"
    image_updated_at    '2016-01-22 14:54:55.962926'
  end
  
end
