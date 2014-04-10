require 'music_apis/responses/track_parser'
require 'music_apis/last_fm/responses/track_parser'
require 'open-uri'

module MusicApis
  module LastFm
    module Track
      def self.search(track_info)
        request = ''
        response = open(URI.escape(request)).read
        return MusicApis::LastFm::Responses::TrackParser response
      end
    end
  end
end