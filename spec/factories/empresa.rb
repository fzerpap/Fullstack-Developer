FactoryGirl.define do
    factory :empresa, class: 'Empresa' do
        sequence(:nome) {|i| "Empresa-#{i}"}
        sequence(:cnpj) {|i| "99999999999-#{i}"}
        cep '18020-210'
        caixa_principal_saldo 0
        caixa_troco_saldo 0
        data_inicio_saldo '10/10/2021'.to_date
        association(:country)

        factory :empresa_mega do
            nome 'Mega'
            cnpj '99999999/999-99'
        end


    end

end