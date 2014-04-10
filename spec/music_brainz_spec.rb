$:.unshift File.expand_path("..", File.dirname(__FILE__))
require 'music_apis/music_brainz/responses/track_parser'
require 'music_apis/responses/track_parser'
require 'music_apis/music_brainz/track'

describe MusicApis::MusicBrainz::Track do
  it "Test" do
    result = MusicApis::MusicBrainz::Track.search({title: "Sinking Ship"})
    result.tracks.each do |track|
      p track.to_s
    end
  end
end