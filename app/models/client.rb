class Client < ApplicationRecord
  validates :name, presence: true
  has_many :projects

  def self.search(search)
    where("name ILIKE ? OR billing_address ILIKE ? OR phone ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
