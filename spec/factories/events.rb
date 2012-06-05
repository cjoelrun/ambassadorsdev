# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    date "2012-06-04"
    start_time "2012-06-04 14:21:27"
    end_time "2012-06-04 14:21:27"
    members_needed 1
    hours 1
    location "MyString"
    instructions "MyText"
    ait false
  end
end
