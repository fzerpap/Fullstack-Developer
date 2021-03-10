FactoryGirl.define do
    factory :transacao_bancarium do
        data Date.today
        transacao_type 0
        referencia 'Referencia'
        entrada_type 0
        valor_entrada 100
        association(:conta_bancarium)
    end

end

