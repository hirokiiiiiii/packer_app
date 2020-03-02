class AddUserIdToBoards < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM boards;'
    add_reference :boards, :user, index: true
  end
  
  def down
    remove_reference :boards, :user, index: true
  end
end
