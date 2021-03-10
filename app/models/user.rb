
class User < ActiveRecord::Base

  devise  :registerable, :recoverable,
          :rememberable, :trackable, :validatable, :session_limitable

  devise :database_authenticatable,:authentication_keys => [:email]

  mount_uploader :avatar_image, AvatarImageUploader

  enum role: [:admin, :no_admin]

  
  validates :email, :full_name, :role, presence: true
  validates_uniqueness_of :email

  
  def self.admin
    where(role: self.roles[:admin])
  end

  def self_no_admin
    Role.where(role: self.roles[:no_admin])
  end

  def self.valid_roles
    %w[admin no_admin]
  end

  def self.xrole
    User.select('role, count(*) as number_users').group(:role)
  end

 
end
