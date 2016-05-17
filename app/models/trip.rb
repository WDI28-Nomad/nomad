class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :expenses, dependent: :destroy

  geocoded_by :destination
  after_validation :geocode, :if => :destination_changed?

end
