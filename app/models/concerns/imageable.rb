module Imageable
  extend ActiveSupport::Concern

  included do
    has_many :images, as: :imageable, dependent: :destroy

    accepts_nested_attributes_for :images,
                                  allow_destroy: true,
                                  reject_if: lambda{ |attrs| attrs.all?{|k,v| v.blank?} }
  end
end
