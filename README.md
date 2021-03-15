# App web for admin users 
## Admin functions
- Sign in
- Dashboard of Users
- CRUD (list, create, edit and delete Users)
- Import Users from a Spreadsheet into the system, in order to create new Users
## User functions
- Sign in
- Profile where de user can edit his Profile.
## Visitor Functions
- Register (sing up) as a normal User.

# Platform used for Deveopment:
- Ruby 2.5.7
- Rails 5.0.7.2
- FrontEnd with 
  - HAML
  - SCSS
  - CoffeeScript, jQuery and Ajax 
- Postgres as Database manager
- ORM (object Relational Map)
- RSpec for models and controllers tests
- Capybara for funcionals tests
- FactoryGirl for test data  

# Steps to install the application:
- Clone from https://github.com/fzerpap/Fullstack-Developer/dev-francisco-zerpa
- Install Ruby 2.5.7
- Inatall Rails 5.0.7.2
- Bundle install
- Rails db:create
- Rails db:migrate db:seed

# Steps to run the application in local mode:
- Rails server
- Go to favorite browser
- Put link localhost:3000

# Steps to run the application in the cloud:
- Go to favorite browser
- Put link: https://fullstack-developer-umanni.herokuapp.com/
- For sign in as admin, with:
  - Login: fzerpap@gmail.com
  - Password: 12345678
 
 # Steps to run the test:
 - On the terminal, type:
  -  rspec spec
 

# Unrealized tasks
- Dockerfile
- Stress tests
 
