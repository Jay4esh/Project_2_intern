class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :approver, class_name: 'User', optional: true

  enum status: { initiator: 0, leader: 1, manager: 2, hr: 3, accountant: 4, approved: 5 }
  enum expense_type: { regular: 0, travel: 1 }

  validates :description, :amount, :date, presence: true
  validates :start_date, :end_date, :source, :destination, :mode_of_transport, presence: true, if: :is_travel?
  

  before_validation :initialize_status, on: :create

  def is_travel?
    expense_type == 'travel'
  end

  def approve!
    update(status: Expense.statuses[:approved])
  end
  
  def reject!
    update(status: Expense.statuses[:rejected])
  end
  
  def submitted?
    status.present? && !initiator?
  end
  
  private

  def initialize_status
    self.status ||= :initiator
  end
end
