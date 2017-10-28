# frozen_string_literal: true
class Project < ApplicationRecord
  validates_presence_of :name
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end