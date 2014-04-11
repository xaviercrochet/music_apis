require 'json'
require 'music_apis/music_brainz/responses/track_parser'
require 'music_apis/track_result'
require 'track'
require 'artist'

describe MusicApis::MusicBrainz::Responses::TrackParser do 
  it "Test structure" do
    response = File.read('spec/fixtures/track_music_brainz.json')
    tracks_json = JSON.parse(response)
    track_parser = MusicApis::MusicBrainz::Responses::TrackParser.new(tracks_json["recording"].first)
    expect(track_parser.track_result).to be_a MusicApis::TrackResult
    expect(track_parser.track_result.track).to be_a ::Track
  end
end