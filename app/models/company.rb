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
  has_many :accounts, :through => :exercises, :uniq => true
  has_many :clientes, :foreign_key => "empresa_id"
  has_many :refenciacontables
  has_many :suppliers, :foreign_key => "empresa_id"
  has_many :tasaivas
  has_many :condicionivas
  has_many :products

  attr_reader :current_exercise

  serialize :engines

  validates_presence_of :name

  before_destroy :can_be_destroyed?

  def current_exercise
    @current_exercise ||= exercises.from(Date.today)
  end

  private

  def can_be_destroyed?
    raise Apslabs::Exceptions::HasExercises if exercises.any?
  end

end

