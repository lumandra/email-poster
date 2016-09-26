FactoryGirl.define do
  sequence :email_to do |n|
    "report#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :report, :class => 'Report' do
    title 'Main Report'
    email_to
  end
end
