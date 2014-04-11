require 'json'
require 'open-uri'

module MusicApis
  module Itunes
    class Query
      #Itunes does NOT support multiple tag search :(
      PARAMS = [:songTerm, :artistTerm]

      def self.search(&blk)
        raise ArgumentError, "Block not give" unless block_given?
        new(&blk).response
      end

      def initialize(&blk)
        @params = {}

        if block_given?
          instance_eval &blk
        end
      end

      def response
        request = 'https://itunes.apple.com/search?term='+@params[:songTerm].to_s+'&attribute=songTerm&entity=musicTrack&limit=200'
        JSON.parse open(URI.escape(request)).read
      end

    private
      def title(value)
        @params[:songTerm] = value
      end

      def artist(value)
        @params[:artistTerm] = value
      end

    end
  end
end