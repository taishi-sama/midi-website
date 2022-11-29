class User < ApplicationRecord
    validates :login, :email, presence: true
    has_many :accesses, dependent: :destroy
    has_many :MIDI_files, through: :accesses
end
