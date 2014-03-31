module MusicApis
  module Spotify
    class Track
      class << self
        def search(track_struct)
          # return ApiResponse::Track.new
          # return SportifyApi::ApiResponse::Track.new response
        end
      end
    end
  end
end

# describe MusicApis::Spotify::Track do
#   expect(MusicApis::Spotify::Track.search({title: "World is mine"})).to be_a(MusicApis::Responses::Track)
# end