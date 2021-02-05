class AddRenterToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :renter_id, :Integer
  end
end
