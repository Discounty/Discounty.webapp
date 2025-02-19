# == Schema Information
#
# Table name: shops
#
#  id                     :integer          not null, primary key
#  name                   :string
#  description            :text
#  chain_store            :string
#  address                :text
#  city                   :string
#  country                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#

require 'rails_helper'

RSpec.describe Shop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
