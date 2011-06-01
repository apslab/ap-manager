# == Schema Information
# Schema version: 20110203105441
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  app_id     :string(255)
#  app_secret :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Client < ActiveRecord::Base
  has_and_belongs_to_many :companies

  def self.authenticate(app_id, app_secret)
    where(["app_id = ? AND app_secret = ?", app_id, app_secret]).first
  end
end

