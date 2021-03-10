FactoryGirl.define do
    factory :caixa_pdv, class: 'CaixaPdv' do
        sequence(:nome) {|i| "Caixa-PDV-#{i}"}
        association(:empresa)
        
    end

end