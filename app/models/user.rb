# == Schema Information
# Schema version: 20110601133856
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  authentication_token   :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :memberships, :include => [:company, :role]
  has_many :companies, :through => :memberships
  has_one :current_company, 
     :class_name => 'Company', 
     :through => :memberships, 
     :conditions => ["memberships.current = ?" , true],
     :source => :company

  def admin?
    current_company.memberships.map(&:role).map(&:name).include?('administrator')
  end

  def current_or_first_company
    current_company || companies.first
  end

  def can_managed_engine?(engine)
    current_or_first_company.engines.include?(engine) &&
    memberships.exists?(:role_id => Role.administrator.id)
  end

  def can_operated_engine?(engine)
    current_or_first_company.engines.include?(engine) &&
    memberships.exists?(:role_id => [Role.administrator.id, Role.operator.id])
  end

  def change_current_company_for(company)
    Membership.transaction do
      memberships.find_by_current(true).toggle!(:current)
      memberships.find_by_company_id(company).toggle!(:current)
      reload
    end
  end
end
