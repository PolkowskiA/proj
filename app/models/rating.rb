class Rating < ApplicationRecord
  belongs_to :project
  belongs_to :comment
end
