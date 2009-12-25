require 'deep_merge/core'
require 'deep_merge/deep_merge_hash'

module DeepMerge
  
  class InvalidParameter < StandardError; end
  
  DEFAULT_FIELD_KNOCKOUT_PREFIX = '--'

end

class Hash
  include DeepMerge::DeepMergeHash
end
