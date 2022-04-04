class CreateDigitizationAgsks < ActiveRecord::Migration[7.0]
  def change
    create_table :digitization_agsks do |t|
      t.text :requirement
      t.string :concept
      t.string :descriptor
      t.integer :formalizability, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
