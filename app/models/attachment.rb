class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  attachment :file

  after_destroy :remove_file

  private

  def remove_file
    file.delete
  end
end
