# == Schema Information
# Schema version: 20110601133856
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  has_many :memberships
  has_many :companies, :through => :memberships, :uniq => true
  has_many :users, :through => :memberships, :uniq => true

  cattr_reader :administrator, :operator

  class << self
    def administrator
      @@administrator ||= self.find_by_name('administrator')
    end

    def operator
      @@operator ||= self.find_by_name('operator')
    end
  end

end

