require 'music_apis/music_brainz/queries/track_query'
require 'json'

describe MusicApis::MusicBrainz::Queries::TrackQuery do
  it "Query should return a JSON object" do
    title = "Sinking Ship"
    artist_name = "Balthazar"
    result = MusicApis::MusicBrainz::Queries::TrackQuery.search do
      title title
      artist artist_name
    end
    expect(result.size).to be >=1
  end
end