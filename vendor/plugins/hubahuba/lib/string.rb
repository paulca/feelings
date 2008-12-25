class String
  def to_md5
    Digest::MD5.hexdigest(self)
  end

  def to_sha1
    Digest::SHA1.hexdigest(self)
  end
end
