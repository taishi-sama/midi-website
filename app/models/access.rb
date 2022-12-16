class Access < ApplicationRecord
  validates :can_edit, presence: true
  belongs_to :user
  belongs_to :midi_file
end
