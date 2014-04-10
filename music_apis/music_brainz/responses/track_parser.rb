require 'music_apis/responses/track_parser'
require 'entities/track'
require 'json'

module MusicApis
  module MusicBrainz
    module Responses

      class TrackParser < ::MusicApis::Responses::TrackParser

        def initialize(response)
          @response = response
          hash_response = JSON.parse(response)
          tracks = hash_response["recording"]
          @tracks = tracks.map do |track|
            build_entity(track)
          end
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
        def format_time(time)
          time.to_i/1000
        end

      end
    end
  end
end