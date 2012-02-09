#source : https://gist.github.com/808022

DEFERRED_GC_THRESHOLD = (ENV['DEFER_GC'] || 1.0).to_f

@@last_gc_run = Time.now

Before do
  begin_gc_deferment
end

After do
  reconsider_gc_deferment
end
def begin_gc_deferment
  GC.disable if DEFERRED_GC_THRESHOLD > 0
end

def reconsider_gc_deferment
  if DEFERRED_GC_THRESHOLD > 0 && Time.now - @@last_gc_run >= DEFERRED_GC_THRESHOLD
    GC.enable
    GC.start
    GC.disable

    @@last_gc_run = Time.now
  end
end

