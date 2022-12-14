class MidiFile < ApplicationRecord
    validates :filename, :public, presence: true
    has_many :accesses, dependent: :destroy
    has_many :users, through: :accesses
    has_many :links, dependent: :destroy

    has_one_attached :midi
    has_one_attached :fluidsynth
    
end
