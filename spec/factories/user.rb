FactoryGirl.define do
    factory :user do
        sequence(:name) {|i| "Name-User-#{i}"}
        sequence(:email) {|i| "user-#{i}@gmail.com"}
        sequence(:username) {|i| "username-#{i}"}
        password "user12345678"
        password_confirmation "user12345678"
        association(:role)
        association(:empresa)
    end
end