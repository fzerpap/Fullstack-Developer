FactoryGirl.define do
    factory :user, class: 'User' do
        sequence(:full_name) {|i| "Full-Name-User-#{i}"}
        sequence(:email) {|i| "user-#{i}@umanni.com.br"}
        password "user12345678"
        password_confirmation "user12345678"
        role 1

        factory :admin do
            role 0
        end



    end
end

