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
end
