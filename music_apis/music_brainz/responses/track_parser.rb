require 'music_apis/responses/track_parser'
require 'music_apis/music_brainz/responses/artist_parser'
require 'entities/track'
require 'json'

module MusicApis
  module MusicBrainz
    module Responses

      class TrackParser < ::MusicApis::Responses::TrackParser

        API_NAME = 'Music Brainz'

        attr_reader :track_result

        def initialize(track_json)
          @track_result = build(track_json)
        end

        def build(track_json)
          TrackResult.new(
            api_name: API_NAME,
            api_id: track_json["id"],
            track: build_track(track_json),
            artist_results: build_artists(track_json["artist-credit"])
            )
        end

      private

        def build_track(track_json)
          track = ::Track.new
          track.title = track_json["title"]
          track.time = format_time(track_json["length"])
          return track
        end

        def format_time(time)
          time.to_i/1000
        end

        def build_artists(track_json)
          track_json.map do |artist_json|
            ArtistParser.new(artist_json).artist_result
          end
        end

      end
    end
  end
end