class LRUCache
  attr_reader :cache

  def initialize(cache)
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count == 4
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    p @cache
  end
end
