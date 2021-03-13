
require 'faker'

User.delete_all

puts "INIT USERS"
User.create(full_name: 'Francisco Zerpa', password: '12345678',
            email: 'fzerpap@gmail.com', role: User.roles[:admin])

(1..500).each do |i|            
    User.create(full_name: Faker::Name.unique.name,
                password: '12345678',
                email: Faker::Internet.email,
                role: User.roles[:no_admin],
                created_at: DateTime.now - i)
end



