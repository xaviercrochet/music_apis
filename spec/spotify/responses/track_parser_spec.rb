$:.unshift File.expand_path("..", File.dirname(__FILE__))
require 'json'
require 'music_apis/spotify/responses/track_parser'
require 'music_apis/track_result'
require 'track'
describe MusicApis::Spotify::Responses::TrackParser do
  it "vd" do
      response = File.read('spec/fixtures/track_spotify.json')
      tracks_json = JSON.parse(response)
      track_parser = MusicApis::Spotify::Responses::TrackParser.new(tracks_json["tracks"].first)
      expect(track_parser.track_result).to be_an_instance_of MusicApis::TrackResult
      expect(track_parser.track_result.track).to be_an_instance_of ::Track
  end
end
