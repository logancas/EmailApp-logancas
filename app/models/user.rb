class User < ApplicationRecord
  include BCrypt

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email_address, presence: true, uniqueness: true
  validate :email_address_is_valid
  validate :first_name_is_capitalized
  validate :last_name_is_capitalized

  has_many :incoming_emails, class_name: 'Email', foreign_key: :recipient_id, dependent: :destroy
  has_many :from_users, through: :incoming_emails
  has_many :outgoing_emails, class_name: 'Email', foreign_key: :sender_id, dependent: :destroy
  has_many :to_users, through: :outgoing_emails

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def first_name_is_capitalized
    errors.add(:first_name, 'is not capitalized.') unless first_name.present? && first_name[0] == first_name[0].capitalize
  end

  def last_name_is_capitalized
    errors.add(:last_name, 'is not capitalized.') unless last_name.present? && last_name[0] == last_name[0].capitalize
  end

  def email_address_is_valid
    if email_address.present? && email_address.include?('@')
      errors.add(:email_address, "must include a '.' after '@'.") unless email_address.split('@')[1].include?('.')
    elsif email_address.present?
      errors.add(:email_address, "must contain '@'.")
    end
  end

  def received_emails
    incoming_emails.where(status: 'sent')
  end

  def sent_emails
    outgoing_emails.where(status: 'sent')
  end

  def drafts
    outgoing_emails.where(status: 'draft')
  end
end
