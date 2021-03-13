
class User < ActiveRecord::Base

  devise  :registerable, :recoverable,
          :rememberable, :trackable, :validatable, :session_limitable

  devise :database_authenticatable,:authentication_keys => [:email]

  mount_uploader :avatar_image, AvatarImageUploader

  # Enumerable for role
  enum role: [:admin, :no_admin]

  
  validates :email, :full_name, :role, presence: true
  validates_uniqueness_of :email

  # return a ActiveRecord of users with role='admin'
  def self.admin
    where(role: self.roles[:admin])
  end

  # return a ActiveRecord of users with role='no_admin'
  def self_no_admin
    where(role: self.roles[:no_admin])
  end

  def self.valid_roles
    %w[admin no_admin]
  end

  # return a array hash with the number of users per role
  # ej: [ {:role => 'admin', :number_users => 99}, {:role => 'no_admin', :number_users => 99} ]
  def self.xrole
    User.select('role, count(*) as number_users')
              .group(:role)
              .order(:role)
              .collect { |u| {role: u.role, number_users: u.number_users} }
  end

  # Adding users to database from users excell
  def self.import(users_excell)
    sucess = false
    users_excell.each do |user_excell| 
      if user_excell[:errors].empty?
        user = self.find_by_email(user_excell[:email]) rescue nil
        if user.nil?
          self.create!(full_name: user_excell[:full_name], email: user_excell[:email], 
          role: user_excell[:role], password: "12345678")
          sucess = true
        end
      end
    end
    return sucess
  end

  # return a array hash with the number of users per day, give month and year
  # ej: [ {:day => 01/01/2021, :number_users => 99}, {:day => 02/01/2021, :number_users => 99}, ... ]
  def self.xdia(year=0, month=0)
    
    select('created_at, count(*) as number_users')
          .where('extract(year from created_at) = ? and extract(month from created_at) = ?', year, month)
          .group(:created_at).order(:created_at)
          .collect { |m| { data: m.created_at, number_users: m.number_users}}

  end
 
end
