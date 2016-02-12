class ThingAttach < ActiveRecord::Base
  belongs_to :thing
  attachment :file, store: 's3_backend', cache: 's3_cache'

  after_destroy :remove_file

  private

  def remove_file
    file.try(:delete)
  end
end
