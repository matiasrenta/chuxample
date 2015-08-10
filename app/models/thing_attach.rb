class ThingAttach < ActiveRecord::Base
  belongs_to :thing
  attachment :file
end
