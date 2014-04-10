require 'music_apis/responses/track_parser'
require 'music_apis/music_brainz/responses/track_parser'
require 'open-uri'

module MusicApis
  module MusicBrainz
    module Track
      def self.search(track_info)
        request = 'http://musicbrainz.org/ws/2/recording?query='+track_info[:title].to_s+'&fmt=json'
        response = open(URI.escape(request)).read
        return MusicApis::MusicBrainz::Responses::TrackParser.new response
      end
    end
  end
end