class AddRaisedMoneyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :amount_raised, :integer
  end
end
