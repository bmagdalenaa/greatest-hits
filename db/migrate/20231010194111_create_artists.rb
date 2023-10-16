class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :artist_name

      t.timestamps
    end
  end
end
