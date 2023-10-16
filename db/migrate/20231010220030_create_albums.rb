class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.integer :access_id
      t.string :album_name
      t.string :release_information
      t.integer :album_rank
      t.text :album_description
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
