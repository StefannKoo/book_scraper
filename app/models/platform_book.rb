class PlatformBook < ApplicationRecord

  has_many :transitions, class_name: "PlatformBookTransition", autosave: false,  dependent: :destroy
  belongs_to :platform
  has_many :audits, dependent: :destroy
  belongs_to :book
  has_many :location_candidates, dependent: :destroy
  has_many :prices, dependent: :destroy

  delegate :current_state, :transition_to, :in_state?, to: :state_machine
  # include Statesman::Adapters::ActiveRecordQueries[
  #    transition_class: LocateTransition,
  #    initial_state: :pending]

  
  def state_machine
    @state_machine ||= LocateStateMachine.new(self, transition_class: PlatformBookTransition,
                                              association_name: :transitions)
  end

  #delegate :transition_to

end
