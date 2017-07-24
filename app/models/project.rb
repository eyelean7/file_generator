class Project < ApplicationRecord
  belongs_to :client

  def self.search(search)
    where("address ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
