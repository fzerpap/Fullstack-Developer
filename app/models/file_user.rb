require 'spreadsheet'
require 'roo'

class FileUser < ApplicationRecord

  validates :name, presence: true

  mount_uploader :name, FileUserUploader    
   
  # return um hash with: users, users_total and users_valids, got from excell
  # Ej. {[{:full_name=>"Pedro Suarez", :email=>"suarez@umanni.com.br", :role=>"no_admin", :errors=>""},..],
  #     users_total: 99, users_valids: 99}
  def import_users(url = 'public'+self.name.url)
    
    users = []
    if !File.exist? url
      return {}
    else
      xlsx = Roo::Spreadsheet.open(url)
      worksheet = xlsx.sheet(0)
      header = worksheet.row(1)
      count_valids = 0
               
      (2..worksheet.last_row).each do |i|

        errors = ""
        regular_exp = /\S+@\S+\.\S+/
        if !regular_exp.match(worksheet.cell('B',i).to_s).nil?
          # Valid if user exist
          user = User.find_by_email(worksheet.cell('B',i)) rescue nil
          errors = !user.nil? ? 'Usuário existe - ' : ""
        else
          errors = 'Email inválido'
        end
        role = worksheet.cell('C',i).to_s
        
        # get others errors of invalid fields
        errors += worksheet.cell('A',i).to_s.blank? ? 'Nome vacio - ' : ""
        errors += role.blank? || (role != 'admin' && role != 'no_admin') ? "Role inválido" : ""

        # Add to the users array  
        users << {full_name: worksheet.cell('A',i).to_s, email: worksheet.cell('B',i).to_s, 
                  role: role, errors: errors }
        count_valids += errors.blank? ? 1 : 0          

      end
    end    
    result = { users_total: worksheet.last_row-1, users_valids: count_valids }
    return count_valids > 0 ?  result.merge(users: users) : result.merge(users: nil)
  end
end
