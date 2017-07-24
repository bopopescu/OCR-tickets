class Ticket < ActiveRecord::Base
  has_attached_file :ticket_img, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :ticket_img, :content_type => /\Aimage\/.*\Z/
end
