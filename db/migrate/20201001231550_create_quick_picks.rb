class CreateQuickPicks < ActiveRecord::Migration[6.0]
  def change
    create_table :quick_picks do |t|
      t.string :station
      t.string :rail_line
      t.string :direction
      t.string :alias
      t.references :user, null: false, foreign_key: true
    end
  end
end
