class AlterUserTable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :photo, :string, default: "https://as1.ftcdn.net/v2/jpg/01/68/80/20/1000_F_168802075_Il6LeUG0NCK4JOELmkC7Ki81g0CiLpxU.jpg"
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
