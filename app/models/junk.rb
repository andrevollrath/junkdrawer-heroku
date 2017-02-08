class Junk < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag

  def to_link
    self.url.match("http") ? self.url : "http://#{self.url}"
  end

  def note_crop
    self.note.chars[0..180].join.strip.gsub(/[!.?,]$/,"") + "..."
  end

  def self.no_params(p)
    #Make sure name or notes is filled in
    p[:junk][:name].empty? && p[:junk][:note].empty? ? true : false 
  end

end
