class CreateAccesses < ActiveRecord::Migration[7.0]
  def change
    create_table :accesses do |t|
      t.references :User, null: false, foreign_key: true
      t.references :MIDI_file, null: false, foreign_key: true
      t.boolean :can_edit

      t.timestamps
    end
  end
end
