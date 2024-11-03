class CreateCoffees < ActiveRecord::Migration[7.2]
  def change
    create_table :coffees do |t|
      t.string :ubicacion
      t.boolean :vacio
      t.string :estado

      t.timestamps
    end
  end
end
