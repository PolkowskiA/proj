<<<<<<< HEAD
class Comment < ApplicationRecord
	validates_presence_of :status
	belongs_to :project
=======
# frozen_string_literal: true
class Comment < ApplicationRecord
  validates_presence_of :content
  belongs_to :project
  belongs_to :user
>>>>>>> auth
end
