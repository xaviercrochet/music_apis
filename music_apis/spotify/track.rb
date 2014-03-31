require 'music_apis/responses/track_parser'
require 'music_apis/spotify/responses/track_parser'
require 'open-uri'
module MusicApis
  module Spotify
    module Track
      def self.search(track_info)
      	# todo Replace by a query to spotify api
      	#response = MusicApis::Spotify::Reponses.new
      	request = 'http://ws.spotify.com/search/1/track.json?q=track:' + track_info[:title].to_s  
        response = open(URI.escape(request)).read

        return MusicApis::Spotify::Responses::TrackParser.new response
        # return ApiResponse::Track.new
        # return SportifyApi::ApiResponse::Track.new response
      end
    end
  end
end

