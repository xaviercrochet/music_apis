require 'music_apis/responses/track_parser'
require 'music_apis/itunes/responses/track_parser'
require 'open-uri'

module MusicApis
  module Itunes
    module Track

      def self.search(track_info)
        request = ''
        response = ''
        #response = open(URI.escape(request)).read
        return MusicApis::Itunes::Responses::TrackParser.new response
      end
    end
  end
end