FactoryGirl.define do
    factory :banco, class: 'Banco' do
        sequence(:nome) {|i| "Banco-#{i}"}
        cep '18210-020'
        association(:empresa)
    end

end