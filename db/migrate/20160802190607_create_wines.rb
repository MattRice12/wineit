class CreateWines < ActiveRecord::Migration[5.0]
  def change
    create_table :wines do |t|
      t.string :type, null: false

      t.timestamps
    end
  end
end
