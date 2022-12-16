class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.references :midi_file, null: false, foreign_key: true
      t.datetime :time_to_expiration

      t.timestamps
    end
  end
end
