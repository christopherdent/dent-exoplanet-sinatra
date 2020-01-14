class Planet < ActiveRecord::Base
  belongs_to :star
  belongs_to :user


  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Planet.all.find { |planet| planet.slug == slug }
  end


end
