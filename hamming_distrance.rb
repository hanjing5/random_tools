require "narray"
class String
  # hamming_distance to measure string similiarity
  def hamming_distance(s)
    if self.nil? or self == "" or s.nil?
      return 0
    end
    dis = 0
    for a, b in self.split("").zip(s.split(""))
      if a == b
        dis+=1
      end
    end
    return dis
  end

  def hamming_distrance_score(s)
    hd = hamming_distance(s)
    return hd / (self.length + s.length)
  end

  #but really, we are just XOR'ing strings
  def xor(s)
    if s.empty?
      self
    else
      if self.length < s.length
        n,r = s.length.divmod(self.length)
        self = left * n + left[0, r]
      elsif s.length < self.length
        n,r = self.length.divmod(s.length)
        s = s * n + s[0, r]
      end

      self_narray = NArray.to_na(self, "byte")
      s_narray = NArray.to_na(s, "byte")

      (self_narray ^ s_narray).to_s
    end
  end

  # so we can use this
  def hamming_distrance(s)
    self.xor(s).tr("\x00", '').length
  end
end
