require 'music_apis/responses/track_parser'
require 'music_apis/spotify/responses/track_parser'
require 'music_apis/spotify/queries/track_query'
require 'active_support'
require 'active_support/core_ext/object/blank'

module MusicApis
  module Spotify
    class Track

      def self.search(track)
      	new(Spotify::Queries::TrackQuery.search do
          title track.title if track.title.present?
          artist track.artists.first.name if track.artists.present?
        end)
      end

      attr_reader :track_results

      def initialize(response)
        @response = response
        @info = @response["info"]
        @tracks_json = @response["tracks"]
        @track_results = @tracks_json.map do |track_json|
          MusicApis::Spotify::Responses::TrackParser.new(track_json).track_result
        end
      end

      def json
        @response
      end
    end
  end
end

