require 'music_apis/spotify/track'
require 'music_apis/spotify/responses/track_parser'

describe MusicApis::Spotify::Track do
  let(:artist){ double(name: "David Guetta") }
  let(:track){ double(title: "World Is Mine", artists: [artist]) }

  it "Test Spotify queries" do
    search = MusicApis::Spotify::Track.search(track)
    expect(search.track_results.first.track).to be_a ::Track
    expect(search.track_results.first.artist_results.first.artist.name).to include "David Guetta"
  end
end