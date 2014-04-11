require 'music_apis/spotify/query'
require 'json'

describe MusicApis::Spotify::Query do 
  it "Query should return a JSON object" do
    title = "World Is Mine"
    artist_name = "David Guetta"
    result = MusicApis::Spotify::Query.search do
      title title
      artist artist_name
    end

    expect(result.size).to be >= 1
  end
end
