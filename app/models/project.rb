# frozen_string_literal: true
class Project < ApplicationRecord

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ unless Rails.env.test?
	belongs_to :user
	validates :name, uniqueness: true, presence: true
	has_many :comments, dependent: :destroy
	
end