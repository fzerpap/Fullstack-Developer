require 'factory_girl'
FactoryGirl.define do
    factory :country, class: 'Country' do
        sequence(:name) {|i| "Country-#{i}"}
        association(:currency)
        association(:language)
    end

end