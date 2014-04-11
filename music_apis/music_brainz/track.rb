require 'music_apis/responses/track_parser'
require 'music_apis/music_brainz/responses/track_parser'
require 'active_support'
require 'active_support/core_ext/object/blank'
require 'music_apis/music_brainz/query'

module MusicApis
  module MusicBrainz
    class Track
      attr_reader :tracks
      
      def self.search(track)
        new(MusicBrainz::Query.search do
          title track.title if track.title.present?
          artist track.artists.first.name if track.artists.present?
          isrc track.isrc if track.isrc.present?
        end)
      end

      def initialize(response)
        @response = response
        @info = {created: response["created"], count: response["count"]}
        @tracks_json = response["recording"]
        @tracks = @tracks_json.map do |track_json|
          MusicApis::MusicBrainz::Responses::TrackParser.new(track_json)
        end
      end

      def json
        @response
      end


    end
  end
end