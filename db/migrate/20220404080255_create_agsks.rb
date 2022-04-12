class CreateAgsks < ActiveRecord::Migration[7.0]
  def change
    create_table :agsks do |t|
      t.text :requirement, null: false, unique: true
      t.string :concept
      t.string :descriptor
      t.integer :filter, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
