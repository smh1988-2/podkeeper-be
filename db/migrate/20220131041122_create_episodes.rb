class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|

      t.references :podcast
      t.string :episodeUrl
      t.string :trackName
      t.string :description
      t.datetime :releaseDate
      t.string :artworkUrl160
      t.string :artworkUrl600
      t.integer :trackTimeMillis
      t.bigint :trackId
      t.integer :collectionId
      t.string :collectionName

      t.timestamps
    end
  end
end
