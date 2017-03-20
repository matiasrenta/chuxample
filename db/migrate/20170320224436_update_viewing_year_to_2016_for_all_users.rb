class UpdateViewingYearTo2016ForAllUsers < ActiveRecord::Migration
  def change
    User.update_all(viewing_year: 2016)
  end
end
