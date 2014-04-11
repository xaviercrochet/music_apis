$:.unshift File.expand_path("..", File.dirname(__FILE__))
require 'json'
require 'music_apis/spotify/responses/track_parser'
require 'music_apis/track_result'
require 'track'
require 'artist'
describe MusicApis::Spotify::Responses::TrackParser do
  it "Test Structure" do
      response = File.read('spec/fixtures/track_spotify.json')
      tracks_json = JSON.parse(response)
      track_parser = MusicApis::Spotify::Responses::TrackParser.new(tracks_json["tracks"].first)
      expect(track_parser.track_result).to be_an_instance_of MusicApis::TrackResult
      expect(track_parser.track_result.track).to be_an_instance_of ::Track
      expect(track_parser.track_result.artist_results.first.artist).to be_a ::Artist
      p track_parser.track_result.track
      p track_parser.track_result.artist_results.first.artist
  end
end
