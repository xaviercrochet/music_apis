require 'music_apis/responses/track_parser'
require 'entities/track'
require 'json'


module MusicApis
  module Spotify
    module Responses
      ## TO Be renamed. Represents the collection of track returned by spotify
      class TrackParser < ::MusicApis::Responses::TrackParser

        def initialize(track_json)
          build(track_json)
        end

        def build(track_json)
          TrackResult.new(
            api_name:   "spotify",
            api_id:     track_json["href"],
            popularity: track_json["popularity"],
            track:      build_track(track_json)
          )
        end

      private

        def build_track(track_json)
          Track.new(
            title:      track_json["name"],
            time:       track_json["length"].to_i,
            isrc:       get_external_id(track_json["external-ids"], 'isrc'),
            artists:    build_artists(track_json)
          )
        end

        def build_artists(track_json)
          track_json['artists'].map do |artist_json|
            ArtistParser.new(artist_json)
          end
        end

        def get_external_id(ids, id_type)
          ids.each do |id|
            if id["type"].eql? id_type
              return id["id"]
            end
          end
          'none'
        end

      end
    end
  end
end