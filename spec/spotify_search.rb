
$:.unshift File.expand_path("..", File.dirname(__FILE__))
require 'music_apis/spotify/responses/track_parser'
require 'music_apis/responses/track_parser'
require 'music_apis/spotify/track'


describe MusicApis::Spotify::Track do
	it "Test" do
  	expect(MusicApis::Spotify::Track.search({title: "Sinking Ship", artist: "Balthazar"})).to be_an_instance_of(MusicApis::Spotify::Responses::TrackParser)
 		expect(MusicApis::Spotify::Track.search({title: "Sinking Ship", artist: "Balthazar"}).tracks.first.to be_an_instance_of(MusicApis::Spotify))
 	end
end