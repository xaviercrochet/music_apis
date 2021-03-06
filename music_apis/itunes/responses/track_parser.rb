require 'music_apis/responses/track_parser'
require 'track'
require 'music_apis/track_result'
require 'music_apis/itunes/responses/artist_parser'
require 'json'

module MusicApis
  module Itunes
    module Responses

      class TrackParser < ::MusicApis::Responses::TrackParser
        API_NAME = 'Itunes'

        attr_reader :track_result

        def initialize(track_json)
          @track_result = build(track_json)
        end

        def build(track_json)
          TrackResult.new(
            api_name: API_NAME,
            api_id: track_json["trackId"],
            track: build_track(track_json),
            artist_results: build_artists(track_json)
            )
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

        def build_artists(track_json)
          #itunes fait une recherche sur tout les élément d'une chanson(nom d'atistte, de musique, etc)
          #Il renvoie donc une collection de chanson avec des infos sur un seul artiste
          #C'est pourquoi je renvoie ici une collection d'artist_result avec juste un seul élement
          #pour matcher la structure des track_results des autres wrappers.
          result = []
          result << ArtistParser.new(track_json).artist_result
          return result
        end

        def build_track(track_json)
          track = ::Track.new
          track.title = track_json['trackName']
          track.time = format_time(track_json['trackTimeMillis'])
          return track
        end

        def format_time(time)
          time.to_i/1000
        end
      end
    end
  end
end