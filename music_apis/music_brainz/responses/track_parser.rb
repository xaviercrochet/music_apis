require 'music_apis/responses/track_parser'
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
            track: build_track(track_json)
            )
        end


        def build_entity(response_track)
          entity = Entities::Track.new(
            title: response_track["title"],
            time: format_time(response_track["length"]),
            api_name: "MusicBrainz",
            api_id: response_track["id"]
            )
        end

      private

        def build_track(track_json)
        end
        def format_time(time)
          time.to_i/1000
        end

      end
    end
  end
end