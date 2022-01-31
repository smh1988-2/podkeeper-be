User.destroy_all
Podcast.destroy_all
UserRelation.destroy_all
UserSubscription.destroy_all
Episode.destroy_all

puts "Starting seeding"

puts "Seeding users"
User.create!(username: "smh1988", password:"123", first_name: "Sean", last_name: "Hurley")
User.create!(username: "pfeytser", password:"123", first_name: "Peter", last_name: "Feytser")
User.create!(username: "oakie", password:"123", first_name: "Oakland", last_name: "Feytser")
User.create!(username: "purrc", password:"123", first_name: "Purrc", last_name: "Hurley")
puts "Finished seeding users"


puts "Seeding follows"
UserRelation.create!(user_id: 1, user2_id: 2, rel_type: "follow")
UserRelation.create!(user_id: 1, user2_id: 4, rel_type: "follow")
UserRelation.create!(user_id: 2, user2_id: 1, rel_type: "follow")
puts "Finished seeding follows"


puts "Seeding podcasts"
Podcast.create!(collectionName: "Doughboys", artistName: "Headgum / Doughboys Media", artworkUrl100:"https://is3-ssl.mzstatic.com/image/thumb/Podcasts115/v4/99/99/e2/9999e2e0-8404-5a54-2546-7f8e43ea5a4a/mza_11747710766916512684.jpg/100x100bb.jpg", artworkUrl600: "https://is3-ssl.mzstatic.com/image/thumb/Podcasts115/v4/99/99/e2/9999e2e0-8404-5a54-2546-7f8e43ea5a4a/mza_11747710766916512684.jpg/600x600bb.jpg", primaryGenreName: "Comedy", artistId: 716626244, collectionId:996151267)
Podcast.create!(collectionName: "Comedy Bang Bang: The Podcast", artistName: "Earwolf and Scott Aukerman", artworkUrl100:"https://is3-ssl.mzstatic.com/image/thumb/Podcasts126/v4/38/11/44/3811445a-8029-c303-571b-0232228adec1/mza_4019156186332834740.jpg/100x100bb.jpg", artworkUrl600: "https://is3-ssl.mzstatic.com/image/thumb/Podcasts126/v4/38/11/44/3811445a-8029-c303-571b-0232228adec1/mza_4019156186332834740.jpg/600x600bb.jpg", primaryGenreName: "Comedy", artistId: 407542375, collectionId:316045799)
puts "Finished seeding podcasts"


puts "Seeding subscriptions"
UserSubscription.create!(user_id: 1, podcast_id: 1, podcast_rating: 5)
UserSubscription.create!(user_id: 1, podcast_id: 2, podcast_rating: 5)
puts "Finished seeding subscriptions"


puts "Seeding episodes"
Episode.create!(podcast_id: 1, episodeUrl: "https://chtbl.com/track/89ED1D/pdst.fm/e/traffic.omny.fm/d/clips/77bedd50-a734-42aa-9c08-ad86013ca0f9/bb15eb7d-0e1d-4fe0-b333-ad8e00138f1d/d072f1c1-a956-4d3a-848b-ae2a001c7b97/audio.mp3?utm_source=Podcast&in_playlist=5f63c2d0-6c12-4e4a-8457-ad8e00138f26", trackName: "Sweet Chick with Tami Sagher", description: "Tami Sagher (Orange Is the New Black, Search Party) joins the 'boys to discuss Gordon Ramsay and Chicago-style pizza before a review of Sweet Chick. Plus, another edition of Cake It Off.\n\nSources for this week's intro:\nhttps://www.dreadpen.com/hip-hop-slang-dictionary/\n\n https://www.nytimes.com/2002/01/06/style/two-of-rap-s-hottest-return-to-the-dis.html \n\nhttps://www.okayplayer.com/culture/nas-amazon-1-billion-pillpack.html \n\nhttps://www.vibe.com/music/music-news/nas-sweet-chick-356455/#! \n\nhttps://www.vibe.com/features/editorial/sweet-chick-owner-john-seymour-interview-chicken-waffles-433115/#!\n\n \n\nSee omnystudio.com/listener for privacy information.", releaseDate: "2022-01-27T08:00:00Z", artworkUrl160: "https://is4-ssl.mzstatic.com/image/thumb/Podcasts116/v4/59/38/6c/59386c2d-e7cf-e9ce-380c-a770002c4af0/mza_1392103919645367616.jpg/60x60bb.jpg", artworkUrl600: "https://is4-ssl.mzstatic.com/image/thumb/Podcasts116/v4/59/38/6c/59386c2d-e7cf-e9ce-380c-a770002c4af0/mza_1392103919645367616.jpg/600x600bb.jpg", trackTimeMillis: 6838000, trackId: 1000549142733, collectionId: 996151267, collectionName: "Doughboys")
puts "Finsihed seeding episodes"


puts "Finished seeding"