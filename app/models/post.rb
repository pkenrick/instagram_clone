class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "550>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  def self.create_with_user(attributes = {}, user)
    attributes[:user] ||= user
    create(attributes)
  end

end

