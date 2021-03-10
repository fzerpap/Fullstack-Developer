# -*- encoding : utf-8 -*-
require 'spreadsheet'
require 'roo'

if !File.exist? File.expand_path 'db/seeds/fornecedors.xlsx'
  puts "Failed the Migration: The db/seeds/fornecedors.xlsx not exist"
else
  xlsx = Roo::Spreadsheet.open('db/seeds/fornecedors.xlsx')

  puts "MIGRATING fornecedors"
  Fornecedor.destroy_all
  worksheet = xlsx.sheet('Fornecedores')
  header = worksheet.row(1)
    
  (2..worksheet.last_row).each do |i|
    row = Hash[[header, worksheet.row(i)].transpose]

    empresa = Empresa.first
    cnpj = row['Documento'].blank? ? '99999999999' : row['Documento']

    if !row['Nome'].blank?
      fornecedor = Fornecedor.create!(nome: row['Nome'], cnpj: cnpj, telefone: row['Telefone'],
      fornecedor_type: 0, empresa_id: empresa.id)
      puts fornecedor.nome
    end
  end
  puts "fornecedors MIGRATED"

end
