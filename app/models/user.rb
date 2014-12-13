class User < ActiveRecord::Base
  belongs_to :employee
	has_many :assests

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :uniqueness => true, format: { with: EMAIL_REGEX }, :case_sensitive => false
  validates :name, :presence =>true
  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create
  validates :employeeid, :uniqueness =>true, :presence =>true

  salt= Digest::SHA1.hexdigest("# We add {email} as unique value and #{Time.now} as random value")
  encrypted_password= Digest::SHA1.hexdigest("Adding #{salt} to {password}") 


  before_save :encrypt_password
  after_save :clear_password

  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

  def self.authenticate(employeeid_or_email="", login_password="")
  	if EMAIL_REGEX.match(employeeid_or_email)
		user = User.find_by_email(employeeid_or_email)
	else
		user = User.find_by_employeeid(employeeid_or_email)
	end
	if user && user.match_password(login_password)
		return user
	else
		return false
	end
  end

  def match_password(login_password="")
	encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end 

end
