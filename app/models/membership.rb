class Membership < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :role
end


# == Schema Information
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

