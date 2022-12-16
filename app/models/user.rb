class User < ApplicationRecord
    validates :login, :email, presence: true
    has_many :accesses, dependent: :destroy
    has_many :midi_files, through: :accesses
    has_secure_password
end
