# frozen_string_literal: true
class Project < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :ratings  
	
end