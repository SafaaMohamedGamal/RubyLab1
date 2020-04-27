class ItemSerializer < ActiveModel::Serializer
  attributes :item_name, :item_description
  def item_name
  	:name
  end
  def item_description
  	:description
  end
end
