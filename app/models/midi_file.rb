class MidiFile < ApplicationRecord
    validates :song_name, :midi, presence: true
    #validates :public, exclusion: [nil]
    validate :validate_midi_max_size
    belongs_to :user
    has_many :accesses, dependent: :destroy
    has_many :accessed_users, through: :accesses, source: :user
    has_many :links, dependent: :destroy

    has_one_attached :midi
    has_one_attached :fluidsynth
    
    scope :public_songs, -> { where(:public => true)}

    def available_for?(user_id)
        return true if public;
        return true if self.user.id == user_id;
        return true if self.accessed_users.where(id:user_id).count > 0;
        false
    end
    def editable_for?(user_id)
        return true if self.user.id == user_id;
        false;
    end
    private
    def validate_midi_max_size
        if midi.byte_size > 1024 * 1024
            errors.add(:midi, 'File can\'t be larger 1 megabyte')
        end
    end
    
    
end
