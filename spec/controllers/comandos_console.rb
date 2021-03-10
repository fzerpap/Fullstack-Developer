country = FactoryGirl.create(:country)
a = FactoryGirl.attributes_for(:empresa).merge({country_id: country.id})
ep=Empresa.create!(a)

ai = FactoryGirl.attributes_for(:empresa)
enp=Empresa.create!(ai)

em=FactoryGirl.create(:empresa_mega)

ne = Empresa.new({ nome: 'Test', cnpj: 'CNPJ-99', cep: '1212'})

banco= FactoryGirl.create(:banco)
conta_bancaria= FactoryGirl.create_list(:conta_bancarium,3, banco_id: banco.id)
empresas = FactoryGirl.create_list(:empresa,2)
empresa = FactoryGirl.create(:empresa)

Empresa.delete_all
Country.delete_all
Currency.delete_all
Language.delete_all

ContaBancarium.delete_all
Banco.delete_all

