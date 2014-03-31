require_relative 'spotify/track'

module MusicApis
  class Track
    class << self
      attr_accessor :track_apis

      def search(track_struct)
        map do |api|
          api.search(track_struct)
        end
      end

      def map
        track_apis.map do |track_api|
          yield track_api
        end
      end

      def each
        track_apis.each do |track_api|
          yield track_api
        end
      end

      def register(klass)
        self.track_apis || []
        self.track_apis << klass
      end
    end
    register MusicApis::Spotify::Track 
  end
end