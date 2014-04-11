require 'music_apis/itunes/query'
require 'json'

describe MusicApis::Itunes::Query do
  it "Query should return a JSON object" do
    title = "Sinking Ship"
    artist_name = "Balthazar"
    result = MusicApis::Itunes::Query.search do 
      title title
      artist artist_name
    end
    expect(result.size).to be >=1
  end
end