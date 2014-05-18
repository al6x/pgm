class Image < ActiveRecord::Base
  belongs_to :gadget

  has_attached_file :image, :styles => {:thumbnail => "200x200>", :icon => "50x50>" }
  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
