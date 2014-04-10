$:.unshift File.expand_path("..", File.dirname(__FILE__))
require 'music_apis/last_fm/responses/track_parser'
require 'music_apis/responses/track_parser'
require 'music_apis/last_fm/track'

describe MusicApis::LastFm::Track do 
  it "Test" do
    result = MusicApis::LastFm::Track.search(title: "Sinking Ship")
  end
end