FactoryGirl.define do
  factory :location_schedule do
    day "MyString"
    open_time "08:00:00"
    close_time "23:00:00"
    location
  end
end
