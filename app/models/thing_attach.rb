class ThingAttach < ActiveRecord::Base
  belongs_to :thing
  attachment :file

  after_destroy :remove_file

  private

  def remove_file
    file.delete
  end
end
