require 'music_apis/itunes/track'
require 'music_apis/itunes/responses/track_parser'
require 'track'
require 'artist'
describe MusicApis::Itunes::Track do
  it "Should return a TrackParser object" do
    track = Track.new()
    track.title = "World is Mine"
    artist = Artist.new
    artist.name = "David Guetta"
    track.artists ||= []
    track.artists << artist
    search_result = MusicApis::Itunes::Track.search(track)
    expect(search_result.tracks.first).to be_a MusicApis::Itunes::Responses::TrackParser
  end
end
