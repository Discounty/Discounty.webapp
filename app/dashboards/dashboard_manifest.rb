# DashboardManifest tells Administrate which dashboards to display
class DashboardManifest
  # `DASHBOARDS`
  # a list of dashboards to display in the side navigation menu
  #
  # These are all of the rails models that we found in your database
  # at the time you installed Administrate.
  #
  # To show or hide dashboards, add or remove the model name from this list.
  # Dashboards returned from this method must be Rails models for Administrate
  # to work correctly.
  DASHBOARDS = [
    :shops,
    :customers,
    :ad_campaigns,
    :advertisements,
    :barcodes,
    :barcode_types,
    :coupons,
    :customer_feedbacks,
    :discount_cards,
    :i18n_keys,
    :locales,
    :recipient_lists,
    :shop_types,
    :translations,
  ]

  # `ROOT_DASHBOARD`
  # the name of the dashboard that will be displayed
  # at "http://your_site.com/admin"
  #
  # This dashboard will likely be the first page that admins see
  # when they log into the dashboard.
  ROOT_DASHBOARD = DASHBOARDS.first
end
