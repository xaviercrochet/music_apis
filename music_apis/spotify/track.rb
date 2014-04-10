require 'music_apis/responses/track_parser'
require 'music_apis/spotify/responses/track_parser'
require 'open-uri'

module MusicApis
  module Spotify
    module Track

      def self.search(track)
      	response = Spotify::Query.search do
          title  track.title
          artist track.formatted_artists
        end
        new(response)
      end

      attr_reader :tracks

      def initialize(response)
        @response = response
        @tracks_json = response["tracks"]
        @tracks = tracks.map do |track_json|
          MusicApis::Spotify::Responses::TrackParser.new(@track_json)
        end
        @info = response[:info].symbolize_keys
      end

      def json
        @response
      end
    end
  end
end

