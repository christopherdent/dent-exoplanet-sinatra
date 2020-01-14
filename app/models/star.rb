class Star < ActiveRecord::Base
  has_many :planets
  belongs_to :user
  include Slugifiable::SlugMethod
  extend Slugifiable::FindBySlug

end
