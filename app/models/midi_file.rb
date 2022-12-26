class MidiFile < ApplicationRecord
    validates :song_name, :midi, presence: true
    validates :public, exclusion: [nil]
    validates :validate_midi_max_size
    belongs_to :user
    has_many :accesses, dependent: :destroy
    has_many :accessed_users, through: :accesses, class_name: :users
    has_many :links, dependent: :destroy

    has_one_attached :midi
    has_one_attached :fluidsynth
    private
    def validate_midi_max_size
        if midi.byte_size > 500 * 1024
            errors.add(:midi, 'File can\'t be larger 500 kilobytes')
        end
    end

end
