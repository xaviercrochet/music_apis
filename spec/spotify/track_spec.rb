require 'music_apis/spotify/track'
require 'music_apis/spotify/responses/track_parser'

describe MusicApis::Spotify::Track do 
  it "Test Spotify queries" do
    track = Track.new()
    track.title = "World Is Mine"
    artist = Artist.new
    artist.name = "David Guetta"
    track.artists ||=[]
    track.artists << artist
    search_result = MusicApis::Spotify::Track.search(track)
    expect(search_result.tracks.first).to be_a MusicApis::Spotify::Responses::TrackParser 
  end
end