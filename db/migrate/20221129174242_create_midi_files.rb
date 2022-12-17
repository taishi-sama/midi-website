class CreateMidiFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :midi_files do |t|
      t.string :song_name
      t.string :author
      t.boolean :public
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
