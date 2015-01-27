class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |p|
      p.column(:total, :float)

      p.timestamps
    end
    
  end
end
