require 'music/spotify/track'

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
    register MusicApis::MusicBrainz::Track
  end
end