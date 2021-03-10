FactoryGirl.define do
    factory :language, class: 'Language' do
      sequence(:name) { |i| "Language-#{i}" }
    end
end