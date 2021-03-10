require 'spreadsheet'
require 'roo'

class FileUser < ApplicationRecord

  mount_uploader :name, FileUserUploader    
   
  def import_users
    
    users = []
    if !File.exist? 'public'+self.name.url
      return users
    else
      xlsx = Roo::Spreadsheet.open('public'+self.name.url)
      worksheet = xlsx.sheet('Users')
      header = worksheet.row(1)
               
      (2..worksheet.last_row).each do |i|
       
        row = Hash[[header, worksheet.row(i)].transpose]
        # valid if user exist 
        user = User.find_by_email(row['email']) rescue nil
        errors = !user.nil? ? 'Usuário existe' : ""
        errors += row['full_name'].empty? ? ' / Nome vacio' : ""

        users << row.merge(errors: errors)

      end
    end    
    return users
  end
end
