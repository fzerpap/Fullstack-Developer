FactoryGirl.define do
    factory :role do
        sequence(:name) {|i| "Role-#{i}"} 
        role_type 0

        factory :role_system do
            name 'Role system'
            role_type 0
        end

        factory :role_administrator do
            name 'Role administrator'
            role_type 1
        end

        factory :role_user do
            name 'Role worker'
            role_type 2
        end
    end
end