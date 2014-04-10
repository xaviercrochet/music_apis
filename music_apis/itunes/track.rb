require 'music_apis/responses/track_parser'
require 'music_apis/itunes/responses/track_parser'
require 'open-uri'

module MusicApis
  module Itunes
    module Track

      def self.search(track_info)
        response = open(URI.escape(generate_url(track_info[:title], 200))).read
        return MusicApis::Itunes::Responses::TrackParser.new response
      end
      
    private
      def self.generate_url(track_title, limit)
        'https://itunes.apple.com/search?term='+track_title+'&entity=musicTrack&limit='+limit.to_s
      end
    end
  end
end