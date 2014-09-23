class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "600x600>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"], 
                                    :size => { :in => 0..10.kilobytes }
  
  validates :image, presence: true
  validates :title, length: { minimum: 3, maximum: 50, too_short: "não pode ter menos que %{count} caracteres", 
                                          too_long: "não pode ter mais que %{count} caracteres" }
  validates :description, presence: true
end
