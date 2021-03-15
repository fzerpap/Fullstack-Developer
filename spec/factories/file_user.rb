FactoryGirl.define do
    factory :file_users_valids, class: 'FileUser' do
      name ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/users_valids.xlsx"),
                                                   filename: 'users_valids.xlsx')
    end

    factory :file_users_invalids, class: 'FileUser' do
      name ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/users_invalids.xlsx"),
                                                  filename: 'users_invalids.xlsx')
    end
      
    factory :file_users_with_errors, class: 'FileUser' do
      name ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/users_with_errors.xlsx"),
                                                  filename: 'users_with_errors.xlsx')
    end

    factory :file_users_excell_invalid, class: 'FileUser' do
      name ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/users_excell_invalid.xlsx"),
                                                  filename: 'users_excell_invalid.xlsx')
    end

 
  end