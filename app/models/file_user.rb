require 'spreadsheet'
require 'roo'

class FileUser < ApplicationRecord

  validates :name, presence: true

  mount_uploader :name, FileUserUploader    
   
  def import_users
    
    users = []
    if !File.exist? 'public'+self.name.url
      return users
    else
      xlsx = Roo::Spreadsheet.open('public'+self.name.url)
      worksheet = xlsx.sheet(0)
      header = worksheet.row(1)
      count_valids = 0
               
      (2..worksheet.last_row).each do |i|
        # Valid if user exist
        user = User.find_by_email(worksheet.cell('B',i)) rescue nil

        regular_exp = /\S+@\S+\.\S+/
        role = worksheet.cell('C',i).to_s
        
        # get errors of invalid fields
        errors = !user.nil? ? 'Usuário existe - ' : ""
        errors += worksheet.cell('A',i).to_s.blank? ? 'Nome vacio - ' : ""
        errors += regular_exp.match(worksheet.cell('B',i).to_s).nil? ? 'Email inválido - ' : ""
        errors += role.blank? || (role != 'admin' && role != 'no_admin') ? "Role inválido" : ""

        # Add to the users array  
        users << {full_name: worksheet.cell('A',i).to_s, email: worksheet.cell('B',i).to_s, 
                  role: role, errors: errors }
        count_valids += errors.empty? ? 1 : 0          

      end
    end    
    return count_valids > 0 ?  users : []
  end
end
