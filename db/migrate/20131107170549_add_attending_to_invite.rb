class AddAttendingToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :attending, :string
  end
end
