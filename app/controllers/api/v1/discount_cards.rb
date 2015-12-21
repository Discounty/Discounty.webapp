require 'doorkeeper/grape/helpers'

module API
  module V1
    class DiscountCards < Grape::API
      helpers Doorkeeper::Grape::Helpers

      helpers do

        def current_customer
          @current_customer ||=
            Customer.find(doorkeeper_token.resource_owner_id)
        end
      end
      include API::Errors
      include API::V1::Defaults

      before do
        doorkeeper_authorize! :customer
      end

      resource 'discount_cards' do

        desc 'Get the discount card of certain id'
        params do
          requires :id, type: Integer, desc: 'Id of the card'
        end
        get ':id' do
          current_customer.discount_cards.find(params[:id])
            .as_json(include: :barcode).to_json
        end

        desc 'Create new discount card for the authenticated customer'
        params do
          requires :name, type: String, desc: 'Name of the card'
          requires :description, type: String, desc: 'Description of the card'
          requires :barcode_type, type: String, desc: 'Type of barcode'
          requires :barcode, type: String, desc: 'Barcode string'
          requires :discount_percentage, type: Float,
                                         desc: 'Float percentage of discount'
          requires :extra_info, type: String, desc: 'Extra info about the card'
          requires :shop, type: String, desc: 'Name of the shop'
        end
        post 'new' do
          # permitted_params = declared(params, include_missing: false)
          ActiveRecord::Base.transaction do
            barcode_type = BarcodeType.find_by(
              barcode_type: params[:barcode_type])
            unless barcode_type
              barcode_type = BarcodeType.create!(
                barcode_type: params[:barcode_type])
            end

            barcode = Barcode.new
            barcode.barcode = params[:barcode]
            barcode.discount_percentage = params[:discount_percentage]
            barcode.extra_info = params[:extra_info]
            barcode.barcode_type = barcode_type

            shop = Shop.find_by(name: params[:shop])

            card = DiscountCard.new(
              name: params[:name],
              description: params[:description],
              customer: current_customer
            )
            if shop
              card.shop = shop
            else
              card.unregistered_shop = params[:shop]
            end
            card.barcode = barcode
            barcode.save!
            card.save!
            card
          end
        end

        desc 'Update the card'
        params do
          requires :id, type: Integer, desc: 'Id of the card to update'
        end
        put ':id' do
          card = current_customer.discount_cards.find(params[:id])
          card.name ||= params[:name]
          card.description ||= params[:description]
          card.shop ||= Shop.where(name: params[:shop]).first

          barcode = card.barcode
          barcode_type = barcode.barcode_type

          barcode.barcode ||= params[:barcode]
          barcode.discount_percentage ||= params[:discount_percentage]
          barcode.extra_info ||= params[:extra_info]
          barcode_type.barcode_type ||= params[:barcode_type]

          barcode_type.save!
          barcode.save!
          card.save!
        end

        desc 'Delete the card'
        params do
          requires :id, type: Integer, desc: 'Id of the card to delete'
        end
        delete ':id' do
          current_customer.discount_cards.find(params[:id]).destroy!
        end
      end
    end
  end
end