require 'json'
require 'open-uri'

module MusicApis
  module MusicBrainz
    class Query

      PARAMS = [:recodring, :isrc, :date, :artist]
      #SEE http://musicbrainz.org/doc/Development/XML_Web_Service/Version_2/Search#Recording
      # for more params.

      def self.search(&blk)
        raise ArgumentError, "Block not given" unless block_given?
        new(&blk).response
      end

      def initialize(&blk)
        @params = {}

        if block_given?
          instance_eval &blk
        end
      end

      def response
        request = 'http://musicbrainz.org/ws/2/recording?query='+ @params.map{|k,v| "#{k}:#{v}"}.join(' AND ') +'&fmt=json'
        JSON.parse open(URI.escape(request)).read
      end

    private
      
      def title(value)
        @params[:recording] = value
      end

      def artist(value)
        @params[:artist] = value
      end

      def isrc(value)
        @params[:isrc] = value
      end
    end
  end
end