require 'music_apis/responses/track_parser'
require 'music_apis/spotify/responses/track_parser'
require 'music_apis/spotify/query'
require 'open-uri'
require 'active_support'
require 'active_support/core_ext/object/blank'

module MusicApis
  module Spotify
    class Track

      def self.search(track)
      	new(Spotify::Query.search do
          title track.title if track.title.present?
          artist track.artists.first.name if track.artists.present?
        end)
      end

      attr_reader :tracks

      def initialize(response)
        @response = response
        @info = @response["info"]
        @tracks_json = @response["tracks"]
        @tracks = @tracks_json.map do |track_json|
          MusicApis::Spotify::Responses::TrackParser.new(track_json)
        end
        # @info = response[:info].symbolize_keys
      end

      def json
        @response
      end
    end
  end
end

