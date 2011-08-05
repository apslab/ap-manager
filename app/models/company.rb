# == Schema Information
# Schema version: 20110606190406
#
# Table name: companies
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  exercises_count :integer         default(0)
#  accounts_count  :integer         default(0)
#  engines         :string(255)
#

class Company < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships

# TODO : esto esta muy acoplado - me da feo olor.
  has_many :exercises, :dependent => :destroy
  has_many :accounts, :through => :exercises, :uniq => true, :readonly => true
  has_many :clientes, :foreign_key => "empresa_id"
  has_many :refenciacontables
  has_many :suppliers, :foreign_key => "empresa_id"
  has_many :tasaivas
  has_many :condicionivas, :foreign_key => "empresa_id"
  has_many :products

  has_many :address_types
  has_many :assistance_types
  has_many :care_types
  has_many :currencies
  has_many :document_types
  has_many :email_types
  has_many :health_insurance
  has_many :marital_statuses
  has_many :people
  has_many :services
  has_many :specialties

  attr_reader :current_exercise

  serialize :engines

  validates_presence_of :name

  before_destroy :can_be_destroyed?

  def current_exercise
    @current_exercise ||= exercises.from_date(Date.today)
  end

  private

  def can_be_destroyed?
    raise Apslabs::Exceptions::HasExercises if exercises.any?
  end

end

