class MidiFile < ApplicationRecord
    validates :song_name, presence: true
    validates :public, exclusion: [nil]
    belongs_to :user
    has_many :accesses, dependent: :destroy
    has_many :accessed_users, through: :accesses, class_name: :users
    has_many :links, dependent: :destroy

    has_one_attached :midi
    has_one_attached :fluidsynth
    
end
