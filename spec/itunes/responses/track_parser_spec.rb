require 'json'
require 'music_apis/itunes/responses/track_parser'
require 'music_apis/track_result'
describe MusicApis::Itunes::Responses::TrackParser do 
  it "Test Structure" do
    response = File.read('spec/fixtures/track_itunes.json')
    tracks_json = JSON.parse(response)
    track_parser = MusicApis::Itunes::Responses::TrackParser.new(tracks_json["results"].first)
  end
end