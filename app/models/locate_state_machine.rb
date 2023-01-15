class LocateStateMachine
    include Statesman::Machine
    state :pending, initial: true
    state :locating
    state :located
    state :approved
    state :error

    transition from: :pending,      to: [:locating]
    transition from: :locating, to: [:located, :error]
    transition from: :located,    to: [:approved]
    transition from: :error,      to: :pending
end