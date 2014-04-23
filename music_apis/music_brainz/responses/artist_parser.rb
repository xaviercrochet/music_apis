require 'json'
require 'artist'
require 'music_apis/artist_result'

module MusicApis
  module MusicBrainz
    module Responses
      class ArtistParser
        API_NAME = 'Music Brainz'

        attr_reader :artist_result

        def initialize(artist_json)
          @artist_result = build(artist_json)
        end

        def build(artist_json)
          ArtistResult.new(
            api_name: API_NAME,
            api_id: artist_json["id"],
            artist: build_artist(artist_json["artist"])
            )
        end

      private

        def build_artist(artist_json)
          artist = ::Artist.new
          artist.name = artist_json["name"]
          return artist
        end
      end
    end
  end
end