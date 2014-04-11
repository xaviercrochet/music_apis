require 'music_apis/spotify/queries/track_query'
require 'json'

describe MusicApis::Spotify::Queries::TrackQuery do 
  it "Query should return a JSON object" do
    #todo => compare with the real json object!!
    title = "World Is Mine"
    artist_name = "David Guetta"
    result = MusicApis::Spotify::Queries::TrackQuery.search do
      title title
      artist artist_name
    end

    expect(result.size).to be >= 1
  end
end
