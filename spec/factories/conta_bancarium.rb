FactoryGirl.define do
    factory :conta_bancarium, class: 'ContaBancarium' do
        sequence(:nro_conta) {|i| "150#{i}".to_i}
        nro_agencia 1234
        association(:banco)
    end

end