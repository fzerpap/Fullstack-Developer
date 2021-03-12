
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

 
end
