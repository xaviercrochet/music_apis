require 'json'
require 'artist'
require 'music_apis/artist_result'

module MusicApis
  module MusicBrainz
    module Responses
      class ArtistParser < ::MusicApis::Responses::TrackParser
        API_NAME = 'Music Brainz'

        attr_reader :artist_result

        def initialize(artist_json)
          @artist_result = build(artist_json)
        end

        def build(artist_json)
          ArtistResult.new
        end
      end
    end
  end
end