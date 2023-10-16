class CreateLyrics < ActiveRecord::Migration[7.0]
  def change
    create_table :lyrics do |t|
      t.integer :song_id
      t.text :lyrics_text

      t.timestamps
    end
  end
end
