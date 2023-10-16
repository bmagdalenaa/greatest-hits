require "csv"

# CSV FILE DATA
# opens and reads greatest_hits.csv
filename = Rails.root.join("db/greatest_hits.csv")
puts "Loading Movies from the CSV file: #{filename}"
csv_data = File.read(filename)

hits = CSV.parse(csv_data, headers: true, encoding: "utf-8")
# headers: Rank, Artist, Album, Info, Description
Artist.destroy_all
Album.destroy_all

# populating artists database
hits.each do |h|
  artist = Artist.find_or_create_by(artist_name: h["Artist"])
  # Artist.create(
  #  artist_name: h["Artist"]
  # )

  next unless artist && artist.valid?

  artist.albums.create(
    access_id:           1,
    album_name:          h["Album"],
    release_information: h["Info"],
    album_rank:          h["Rank"],
    album_description:   h["Description"]
  )
end
