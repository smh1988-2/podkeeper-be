class EpisodeSerializer < ActiveModel::Serializer
  attributes :podcast_id, 
  :trackName,
  :description,
  :releaseDate,
  :artworkUrl160,
  :artworkUrl600,
  :trackTimeMillis,
  :trackId,
  :collectionId,
  :collectionName,
  :created_at,
  :updated_at
end