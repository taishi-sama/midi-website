class User < ApplicationRecord
    validates :login, :email, presence: true
    has_many :midi_files
    has_many :accesses, dependent: :destroy
    has_many :accessed_midi_files, through: :accesses, class_name: :midi_files
    has_secure_password
end
