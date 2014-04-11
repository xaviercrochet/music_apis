require 'json'
require 'music_apis/itunes/responses/track_parser'
require 'music_apis/track_result'
describe MusicApis::Itunes::Responses::TrackParser do 
  it "Test Structure" do
    response = File.read('spec/fixtures/track_itunes.json')
    tracks_json = JSON.parse(response)
    track_parser = MusicApis::Itunes::Responses::TrackParser.new(tracks_json["results"].first)
    expect(track_parser.track_result).to be_a MusicApis::TrackResult
    expect(track_parser.track_result.api_id).not_to be_nil
    expect(track_parser.track_result.track).to be_a ::Track
    expect(track_parser.track_result.track.title).not_to be_nil
    expect(track_parser.track_result.track.time).not_to be_nil
  end
end