class AddAttachmentToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :attachment, :string
  end
end