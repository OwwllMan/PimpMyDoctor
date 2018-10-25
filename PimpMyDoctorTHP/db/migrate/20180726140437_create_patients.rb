class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      # ajout city_id table patients 
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
