module MusicApis
  module Spotify
    module Responses
      class Track << Responses::Track

        def initialize(response)
          @response = response
          @tracks = response.tracks.each do |r_track|
            build_entity(r_track)
          end
        end

        def build_entity(response_track)
          Entities::Track.new({
            title: response_track.track_title,
            version: response_track.track_version
          })
        end
      end
    end
  end
end