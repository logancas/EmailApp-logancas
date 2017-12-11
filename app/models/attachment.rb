class Attachment < ApplicationRecord
  belongs_to :email, inverse_of: :attachments
  has_attached_file :file
  do_not_validate_attachment_file_type :file
end
