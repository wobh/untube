class ChangeVideoFilenameToBasename < ActiveRecord::Migration
  def change
    change_table :videos do |t|
      t.rename :filename, :base_name
    end
  end
end
