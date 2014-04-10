require 'music_apis/responses/track_parser'
require 'music_apis/itunes/responses/track_parser'
require 'open-uri'

module MusicApis
  module Itunes
    module Track

      def self.search(track_info)
        request = 'https://itunes.apple.com/search?term='+track_info[:title].to_s+'&entity=musicTrack'
        response = open(URI.escape(request)).read
        p URI.escape(request).to_s
        return MusicApis::Itunes::Responses::TrackParser.new response
      end
    end
  end
end