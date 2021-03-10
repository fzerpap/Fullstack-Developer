

User.delete_all

puts "INIT USERS"
User.create(full_name: 'Francisco Zerpa', password: '12345678',
            email: 'fzerpap@gmail.com', role: User.roles[:admin])



