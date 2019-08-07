class User < ApplicationRecord
has_secure_password

# Validations
validates_presence_of :name, :email, :password_digest
has_many :diaries
has_many :affirmations

end
