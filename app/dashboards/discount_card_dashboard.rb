require "administrate/base_dashboard"

class DiscountCardDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    shop: Field::BelongsTo,
    customer: Field::BelongsTo,
    barcode: Field::HasOne,
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    unregistered_shop: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :shop,
    :customer,
    :barcode,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :shop,
    :customer,
    :barcode,
    :name,
    :description,
    :unregistered_shop,
  ]

  # Overwrite this method to customize how discount cards are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(discount_card)
  #   "DiscountCard ##{discount_card.id}"
  # end
end
