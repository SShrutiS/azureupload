class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :name, null: false
      t.string :yrmnth, null: false
      t.string :azure
      t.string :link
      t.string :approval, default: 'Pending'
      t.text :comment

      t.timestamps
    end
  end
end
