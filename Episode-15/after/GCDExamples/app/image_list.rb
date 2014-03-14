class ImageList
  attr_accessor :images

  def self.sharedInstance
    Dispatch.once { @shared = self.new }
    @shared
  end

  def initialize
    @images = [
      "http://lorempixel.com/200/200/nature/1/",
      "http://lorempixel.com/400/400/nature/2/",
      "http://lorempixel.com/50/50/nature/3/"
    ]
  end
end