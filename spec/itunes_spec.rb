$:.unshift File.expand_path("..", File.dirname(__FILE__))
require 'music_apis/itunes/responses/track_parser'
require 'music_apis/responses/track_parser'
require 'music_apis/itunes/track'

describe MusicApis::Itunes::Track do 
  it "Test" do
    MusicApis::Itunes::Track.search(:title => "Sinking Ship")
  end
end