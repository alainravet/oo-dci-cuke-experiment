class String

  def dequote
    str = self
    ret = (/\A"(.*)"\Z/ =~ str) ? $1 : str.dup
    ret.gsub!(/\\(.)/, "\\1")
    ret
  end

end