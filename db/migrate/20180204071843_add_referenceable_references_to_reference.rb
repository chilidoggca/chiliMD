class AddReferenceableReferencesToReference < ActiveRecord::Migration[5.1]
  def change
    add_reference :references, :referenceable, polymorphic: true
  end
end
