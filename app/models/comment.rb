# frozen_string_literal: true
class Comment < ApplicationRecord
  validates_presence_of :status
  belongs_to :project
end
