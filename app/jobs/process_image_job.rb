class ProcessImageJob < ApplicationJob
  queue_as :images

  def perform(id)
    # Do something later
    img = MenuItem.find_by(id: id)
    img.process_img
  end
end
