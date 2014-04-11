require 'music_apis/music_brainz/query'
require 'json'

describe MusicApis::MusicBrainz::Query do
  it "Query should return a JSON object" do
    title = "Sinking Ship"
    aritst_name = "Balthazar"
    result = MusicApis::MusicBrainz::Query.search do 
      title title
      artist aritst_name
    end
    expect(result.size).to be >=1
  end
end