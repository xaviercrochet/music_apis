module MusicApis
  class Spotify::Query

    PARAMS = [:title, :artist, :genre, :isrc, :year]

    # Spotify::Query.search do
    #   title ""
    #   artist ""
    # end

    # Spotify::Query.find()

    def self.search(&blk)
      new(blk)
    end

    # TODO
    def self.find(spofity_id)
      request = 'http://ws.spotify.com/...'
      response = open(URI.escape(request)).read
    end

    def initialize
      @params = {}

      if block_given?
        instance_eval(blk)
        response
      end
    end

  private

    PARAMS.each do |param|
      eval %Q{
        def #{param}(value)
          @params[#{param}] = value
        end
      }
    end

    def response
      request = 'http://ws.spotify.com/search/1/track.json?q=' + @params.map{|k,v| "#{k}=v"}.join('&q=')
      JSON.parse open(URI.escape(request)).read
    end
  end
end