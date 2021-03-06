class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :expenses, dependent: :destroy

  #validations
  validates :name, :budget, :origin, :destination,
  presence: true,  length: { maximum: 255}

  geocoded_by :destination
  after_validation :geocode, :if => :destination_changed?

end
