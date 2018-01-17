# frozen_string_literal: true
class User < ApplicationRecord
  has_secure_password
  validates_length_of :name, minimum:4
  validates_presence_of :password, :email
  validates_length_of :password, minimum: 6
  validates_confirmation_of :password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_many :projects
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
end
