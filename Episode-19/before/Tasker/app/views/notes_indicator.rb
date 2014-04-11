class NotesIndicator < UIImageView
  def configure(data = {})
    if data[:has_note]
      self.image = UIImage.imageNamed("Notepad")
    else
      self.image = nil
    end
    self.updateConstraintsIfNeeded
  end
end