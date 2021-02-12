FactoryBot.define do
  factory :event do
    name {"アイウエオ"}
    explanation {"この商品は"}
    genre_id {2}
    day {Date.today + 1}
    start_time_id {2}
    end_time_id {6}
    capacity {"3"}
    area_id {3}
    place {"あああ"}
    association :user 

    after(:build) do |event|
      event.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
