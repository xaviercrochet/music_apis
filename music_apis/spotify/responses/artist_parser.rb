require 'json'
require 'artist'
require 'music_apis/artist_result'

module MusicApis
  module Spotify
    module Responses
      class ArtistParser < ::MusicApis::Responses::TrackParser
        API_NAME = 'Spotify'

        attr_reader :artist_result

        def initialize(artist_json)
          @artist_result = build(artist_json)
        end

        def build(artist_json)
          ArtistResult.new(
            api_name: API_NAME,
            api_id: artist_json["href"],
            artist: build_artist(artist_json)
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