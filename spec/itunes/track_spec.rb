require 'music_apis/itunes/track'
require 'music_apis/itunes/responses/track_parser'
require 'track'
require 'artist'
describe MusicApis::Itunes::Track do
  # it "Should return a TrackParser object" do
  #   track = Track.new()
  #   track.title = "World is Mine"
  #   artist = Artist.new
  #   artist.name = "David Guetta"
  #   track.artists ||= []
  #   track.artists << artist
  #   search_result = MusicApis::Itunes::Track.search(track)
  #   expect(search_result.tracks.first).to be_a MusicApis::Itunes::Responses::TrackParser
  # end

    let(:artist){ double(name: "David Guetta") }
    let(:track){ double(title: "World Is Mine", artists: [artist], isrc: nil) }

    it "Test Itunes queries" do
        search = MusicApis::Itunes::Track.search(track)
        expect(search.track_results.first.track).to be_a ::Track
        expect(search.track_results.first.track.title).to include "World Is Mine"
    end
end
