require 'archivist/models'
require 'representable'
require 'representable/xml'

module Archivist
  module Representation
    class FormatIndex < Representable::Decorator
      include Representable::XML

      self.representation_wrap = 'files'

      collection :formats, as: 'file',
                 class: Model::FileFormat,
                 decorator: FileFormat
    end
  end
end
