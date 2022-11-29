class Access < ApplicationRecord
  validates :can_edit, presence: true
  belongs_to :User
  belongs_to :MIDI_file
end
