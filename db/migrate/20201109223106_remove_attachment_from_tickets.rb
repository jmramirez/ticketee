class RemoveAttachmentFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :attachment, :string
  end
end
