class CreatePodcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |t|
      t.string :collectionName
      t.string :artistName
      t.string :artworkUrl100
      t.string :artworkUrl600
      t.string :primaryGenreName
      t.integer :artistId
      t.integer :collectionId

      t.timestamps
    end
  end
end
