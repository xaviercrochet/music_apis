require 'music_apis/responses/track_parser'
require 'entities/track'
require 'json'

module MusicApis
  module Itunes
    module Responses

      class TrackParser < ::MusicApis::Responses::TrackParser

        def initialize(response)
          @response = response
          hash_response = JSON.parse response
          tracks = hash_response["results"]
          @tracks = tracks.map do |track|
            build_entity(track)
          end
        end

        def build_entity(track_info)
          entity = Entities::Track.new(
            title: track_info['trackName'],
            time: format_time(track_info['trackTimeMillis']),
            api_name: "Itunes",
            api_id: track_info['trackId']
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