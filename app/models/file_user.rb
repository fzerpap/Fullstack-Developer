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
               
      (2..worksheet.last_row).each do |i|
        # Valid if user exist
        user = User.find_by_email(worksheet.cell('B',i)) rescue nil

        # get errors of invalid fields
        regular_exp = /\S+@\S+\.\S+/
        errors = !user.nil? ? 'Usuário existe - ' : ""
        errors += worksheet.cell('A',i).blank? ? 'Nome vacio - ' : ""
        errors += regular_exp.match(worksheet.cell('B',i)).nil? ? 'Email inválido' : ""
 
        # Add to the users array  
        users << {full_name: worksheet.cell('A',i), email: worksheet.cell('B',i), 
                  role: worksheet.cell('C',i), errors: errors }

      end
    end    
    return users
  end
end
