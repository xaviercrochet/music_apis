require 'json'
require 'open-uri'
require 'music_apis/query'

module MusicApis
  module Itunes
    module Queries
      class TrackQuery < MusicApis::Query
        
        #Itunes does NOT support multiple tag search :(
        PARAMS = [:songTerm]

      private
        def attribute_to_param
          #nothing to do here
        end

        def base_url
          request = 'https://itunes.apple.com/search?term='
        end

        def formatted_params
          @params[:title]
        end

        def end_url
          '&attribute=songTerm&entity=musicTrack&limit=200'
        end
      end
    end
  end
end