class LRUCache
  def initialize(range)
    @range = range
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)
      @cache.delete(el) #delete most recently used to make room for new el
      @cache << el
    elsif count >= @size
      @cache.shift
      @cache << el
    else
      @cache << el
    end  
  end

  def show
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

end
