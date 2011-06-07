# == Schema Information
# Schema version: 20110601133856
#
# Table name: memberships
#
#  id         :integer         not null, primary key
#  company_id :integer
#  role_id    :integer
#  user_id    :integer
#  current    :boolean         default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_memberships_on_user_id_and_company_id              (user_id,company_id)
#  index_memberships_on_user_id_and_role_id                 (user_id,role_id)
#  index_memberships_on_user_id_and_company_id_and_role_id  (user_id,company_id,role_id)
#

class Membership < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :role
end

