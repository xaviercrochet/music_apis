require 'json'
require 'open-uri'
require 'music_apis/query'

module MusicApis
  module MusicBrainz
    module Queries
      class TrackQuery < MusicApis::Query

        PARAMS = [:recording, :isrc, :date, :artist]
        #SEE http://musicbrainz.org/doc/Development/XML_Web_Service/Version_2/Search#Recording
        # for more params.

      private

        def attribute_to_params
          {
            title:   :recording,
            artist:  :artist,
            isrc:    :isrc,
            p_year:  :year
          }
        end

        def base_url
          'http://musicbrainz.org/ws/2/recording?query='
        end

        def formatted_params
          @params.map do |k,v|
            "#{attribute_to_params[k]}:#{v}"
          end.join(' AND ')
        end

        def end_url
          '&fmt=json'
        end

      end
    end
  end
end