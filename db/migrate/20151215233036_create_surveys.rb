class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :coffees
      t.decimal :emotion
      t.string :weatherMain
      t.text :weatherDesc
      t.decimal :dayTempHi
      t.decimal :dayTempLow
      t.decimal :currentTemp

      t.timestamps null: false
    end
  end
end
