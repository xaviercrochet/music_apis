require 'json'
require 'open-uri'
require 'music_apis/query'

module MusicApis
  module Spotify
    class Query < MusicApis::Query

    private

      def base_url
        'http://ws.spotify.com/search/1/track.json?q='
      end

      def formatted_params
        @params.map do |k,v|
          "#{attribute_to_params[k]}:#{v}"
        end.join('&q=')
      end

    end
  end
end