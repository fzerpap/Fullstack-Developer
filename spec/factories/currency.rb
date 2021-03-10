FactoryGirl.define do
  factory :currency, class: 'Currency' do
    sequence(:name) { |i| "Currency-#{i}" }
  end
end