require 'ruby-debug'
$:.unshift File.expand_path("..", File.dirname(__FILE__))
require 'music_apis/spotify/responses/track_parser'
require 'music_apis/responses/track_parser'
require 'music_apis/spotify/track'
require 'track'
require 'artist'

describe MusicApis::Spotify::Track do

  track = Track.new()
  track.title = "World Is Mine"
  artist = Artist.new
  artist.name = "David Guetta"
  track.artists ||= []
  track.artists << artist
  p track
  result = MusicApis::Spotify::Track.search(track)
  it {expect(result.tracks.size).to be >= 1}
  result.tracks.each do |t|
    p t.track_result.api_name
  end


end