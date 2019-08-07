class Diary < ApplicationRecord
  # Validations
  validates_presence_of :title, :entry
  belongs_to :user
end
