class Encounter < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  validates :user1_id, presence: true
  validates :user2_id, presence: true
  validates :address, presence: true

  def encounter!(user1, other_user, address)
    self.create!(user1_id: user1.id, user2_id: other_user.id, address: address)
  end
  
end
