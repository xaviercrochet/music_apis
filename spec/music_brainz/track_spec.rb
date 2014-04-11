require 'music_apis/music_brainz/track'
require 'music_apis/music_brainz/responses/track_parser'
require 'track'
require 'artist'

describe MusicApis::MusicBrainz::Track do
  # it "Should return a TrackParser object" do
  #   track = Track.new()
  #   track.title = "World is Mine"
  #   artist = Artist.new
  #   artist.name = "David Guetta"
  #   track.artists ||= []
  #   track.artists << artist
  #   search_result = MusicApis::MusicBrainz::Track.search(track)
  #   expect(search_result.tracks.first).to be_a MusicApis::MusicBrainz::Responses::TrackParser
  # end

  let(:artist){ double(name: "David Guetta") }
  let(:track){ double(title: "World Is Mine", artists: [artist], isrc: nil) }

  it "Test Spotify queries" do
    search = MusicApis::MusicBrainz::Track.search(track)
    expect(search.track_results.first.track).to be_a ::Track
    expect(search.track_results.first.track.title).to include "World Is Mine"
    expect(search.track_results.first.artist_results.first.artist.name).to include "David Guetta"
  end
end