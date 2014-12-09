class CreateRespsurveys < ActiveRecord::Migration
  def change
    create_table :respsurveys do |t|
      t.belongs_to :survey
      t.belongs_to :user
      t.timestamps
    end
  end
end
