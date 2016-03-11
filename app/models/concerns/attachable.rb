module Attachable
  extend ActiveSupport::Concern

  included do
    has_many :files, as: :attachable, dependent: :destroy

    accepts_nested_attributes_for :file_attachments,
                                  allow_destroy: true,
                                  reject_if: lambda{ |attrs| attrs.all?{|k,v| v.blank?} }
  end
end
