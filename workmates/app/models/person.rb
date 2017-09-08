class Person < ApplicationRecord
  validates :name, presence: true
  has_attached_file :image, styles: {large: "600x600>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type:  /\Aimage\/.*\Z/

end
