class Star < ActiveRecord::Base
  has_many :planets
  belongs_to :user
end
