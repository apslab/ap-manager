# == Schema Information
# Schema version: 20110601133856
#
# Table name: companies
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  exercises_count :integer         default(0)
#  current         :boolean         default(FALSE)
#  accounts_count  :integer         default(0)
#

class Company < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :exercises, :dependent => :destroy
  has_many :accounts

  serialize :engines

  validates_presence_of :name

  before_destroy :can_be_destroyed?

  private
  
  def can_be_destroyed?
    raise Apslabs::Exceptions::HasExercises if exercises.any?
  end

end
