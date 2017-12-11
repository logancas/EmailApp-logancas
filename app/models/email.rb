class Email < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id
  has_many :attachments, class_name: 'Attachment', inverse_of: :email
  validates :status, presence: true
  validates :sender, presence: true
  validates :recipient, presence: true
  accepts_nested_attributes_for :attachments, reject_if: :all_blank
end
