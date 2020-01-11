class User < ActiveRecord::Base

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
