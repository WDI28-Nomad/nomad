class Trip < ActiveRecord::Base
  belongs_to :user
  geocoded_by :destination
  after_validation :geocode, :if => :destination_changed?
end
