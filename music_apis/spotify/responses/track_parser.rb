require 'music_apis/responses/track_parser'
require 'entities/track'
require 'json'


module MusicApis
  module Spotify
    module Responses
      ## TO Be renamed. Represents the collection of track returned by spotify
      class TrackParser < ::MusicApis::Responses::TrackParser

        def initialize(response)
          @response = response
          hash_response = JSON.parse(response)
          tracks = hash_response["tracks"]
          tracks.each do |track|
            build_entity(track)
          end
          
        end

        def build_entity(response_track)
          Entities::Track.new({
            :title => response_track["name"]
          })
        end

      end
    end
  end
end