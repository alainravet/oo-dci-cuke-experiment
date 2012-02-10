#
# When an object is created/retrieved in a step definition,
# we store it into the cache.
#

Before do
  # clear the cache before each scenario
  @_cache         = {}
end


def cache_push(key, value)
  key = key.to_sym

  @_cache[key] = value

  if [:meeting, :proposal, :talk].include?(key)
    @_cache[:last_object] = value
  end

end


def cache_get(key)
  @_cache[key.to_sym]
end

# shortcut
def c_it
  cache_get(:last_object)
end