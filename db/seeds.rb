
require 'faker'

User.delete_all

puts "INIT USERS"
User.create(full_name: 'Francisco Zerpa', password: '12345678',
            email: 'fzerpap@gmail.com', role: User.roles[:admin])

j = 0            
(1..12).each do |i| 
    (1..rand(15..31)).each do |k|    
        (1..rand(15)).each do |l|      
            User.create(full_name: Faker::Name.unique.name,
                    password: '12345678',
                    email: Faker::Internet.email,
                    role: User.roles[:no_admin],
                    created_at: DateTime.now - (j + k ))
        end
    end
    j += 30
end



