class Item < ApplicationRecord
  has_attached_file :image    # Item has an attached image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/    # Validating image upload
end
