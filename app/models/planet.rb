class Planet < ActiveRecord::Base
  belongs_to :star
  belongs_to :user

  include Slugifiable::SlugMethod
  extend Slugifiable::FindBySlug




end
