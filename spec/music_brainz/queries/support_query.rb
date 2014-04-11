require 'music_apis/music_brainz/queries/support_query'

describe MusicApis::MusicBrainz::Queries::SupportQuery do 
  it "Support Query should return a JSON object" do
    title = "Guetta Blaster"
    catno = "571970-2"
    result = MusicApis::MusicBrainz::Queries::SupportQuery.search do
      catalog_number catno
      title title
    end

    expect(result.size).to be >= 1
  end
end