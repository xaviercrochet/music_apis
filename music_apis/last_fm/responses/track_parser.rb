require 'music_apis/responses/track_parser'
require 'entities/track'
require 'json'


module MusicApis
  module Lastfm
    module Responses

      class TrackParser < ::MusicApis::Responses::TrackParser

        def initialize(response)
          @response = response
        end

        def build_entity(response_track)
          entity = Entities::Track.new(
            )
        end
      end
    end
  end
end