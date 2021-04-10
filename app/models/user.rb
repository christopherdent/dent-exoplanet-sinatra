class User < ActiveRecord::Base
  #validates_uniqueness_of :username
  validates :username, on: :create, uniqueness: { case_sensitive: false, message: "An account has already been made with this email address." }
  has_secure_password
  has_many :planets
  has_many :stars

  def slug
    self.username.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    User.all.detect { |u| u.slug == slug}
  end

end
