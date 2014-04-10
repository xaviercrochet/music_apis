module MusicApis
  class Spotify::Query

    PARAMS = [:title, :artist, :genre, :isrc, :year]

    # Spotify::Query.search do
    #   title ""
    #   artist ""
    # end

    # Spotify::Query.find()

    def self.search(&blk)
      raise ArgumentError, "Block not given" unless block_given?
      new(&blk).response
    end

    # TODO
    def self.find(spofity_id)
      request = 'http://ws.spotify.com/...'
      response = open(URI.escape(request)).read
    end

    def initialize(&blk)
      @params = {}

      if block_given?
        instance_eval &blk
      end
    end

    def response
      request = 'http://ws.spotify.com/search/1/track.json?q=' + @params.map{|k,v| "#{k}:#{v}"}.join('&q=')
      JSON.parse open(URI.escape(request)).read
    end

  private

    def title(value)
      @params[:title] = value
    end

    def artist(value)
      @params[:artist] = value
    end


    #todo ajouter les méthodes correspondantes?
    # PARAMS.each do |param|
    #   eval %Q{
    #     def #{param}(value)
    #       @params[#{param}] = value
    #     end
    #   }
    # end


  end
end