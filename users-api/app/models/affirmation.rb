class Affirmation < ApplicationRecord
  validates_presence_of :note
  belongs_to :user

end
