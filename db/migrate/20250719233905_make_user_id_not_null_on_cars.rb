class MakeUserIdNotNullOnCars < ActiveRecord::Migration[7.0]
  def change
    change_column_null :cars, :user_id, false
  end
end
