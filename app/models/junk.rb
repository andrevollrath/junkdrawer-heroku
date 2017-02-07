class Junk < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag

  def self.no_params(p)
    #Make sure atleast one thing is filled out
    !p[:junk].any? {|k,v| !v.empty?}
  end

end
