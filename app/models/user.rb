class User < ActiveRecord::Base
  has_many :gadgets

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  # NOTE: Using hashes instead of raw passwords.
  def self.signin name, password
    return false if name.blank? or password.blank?
    User.find_by name: name, password: Digest::MD5.hexdigest(password)
  end

  def self.signup name, password
    return false if name.blank? or password.blank?
    user = User.new
    user.name = name
    user.password = Digest::MD5.hexdigest password
    user.save
  end
end