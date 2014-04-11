require 'music_apis/spotify/track'
require 'music_apis/music_brainz/track'
require 'music_apis/itunes/track'

module MusicApis
  class Track
    class << self
      attr_accessor :track_apis

      def search(track_struct)
        map do |api|
          api.search(track_struct)
        end
      end

      def map(&blk)
        track_apis.map blk
      end

      def each(&blk)
        track_apis.each blk
      end

      def register(klass)
        self.track_apis ||= []
        self.track_apis << klass
      end
    end
    register MusicApis::Spotify::Track
    register MusicApis::Itunes::Track
    register MusicApis::MusicBrainz::track 
  end
end