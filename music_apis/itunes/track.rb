require 'music_apis/responses/track_parser'
require 'music_apis/itunes/responses/track_parser'
require 'music_apis/itunes/query'
require 'open-uri'
require 'active_support'
require 'active_support/core_ext/object/blank'

module MusicApis
  module Itunes
    class Track
      attr_reader :tracks

      #!!! Itunes does NOT support multiple tag search
      def self.search(track)
        new(Itunes::Query.search do
          title track.title if track.title.present?
          artist track.artists.first.name if track.artists.present?
          end)
      end

      def initialize(response)
        @response = response
        @info = {resultCount: response["resultCount"]}
        @tracks_json = response["results"] 
        @tracks = @tracks_json.map do |track_json|
          MusicApis::Itunes::Responses::TrackParser.new(track_json)
        end
      end

      def json
        @response
      end
    end
  end
end