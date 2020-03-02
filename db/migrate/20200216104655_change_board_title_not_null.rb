class ChangeBoardTitleNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :boards, :title,false
  end
end