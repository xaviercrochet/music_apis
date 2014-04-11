require 'json'
require 'open-uri'

module MusicApis
  class Query

    def self.search(&blk)
      raise ArgumentError, "Block not given" unless block_given?
      new(&blk).response
    end

    def initialize(&blk)
      @params = {}

      if block_given?
        instance_eval &blk
      end
    end

    def response
      request = base_url + formatted_params + end_url
      p URI.escape(request)
      JSON.parse open(URI.escape(request)).read
    end

  private

    def attribute_to_params
      {
        title:   :title,
        artist:  :artist,
        genre:   :genre,
        isrc:    :isrc,
        p_year:  :year
      }
    end

    def title(value)
      @params[:title] = value
    end

    def p_year(value)
      @params[:p_year] = value
    end

    def genre(value)
      @params[:genre] = value
    end

    def isrc(value)
      @params[:isrc] = value
    end

    def artist(value)
      @params[:artist] = value
    end

    def catalog_number(value)
      @params[:catalog_number] = value
    end

    def bar_code(value)
      @params[:bar_code] = value
    end

    def base_url
      raise NoMethodError, "This must be implemented"
    end

    def formatted_params
      raise NoMethodError, "This must be implemented"
    end

    def end_url
      ''
    end

  end
end