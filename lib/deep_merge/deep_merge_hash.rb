require 'deep_merge/core'

module DeepMerge
  module DeepMergeHash
    # ko_deep_merge! will merge and knockout elements prefixed with DEFAULT_FIELD_KNOCKOUT_PREFIX
    def ko_deep_merge!(source, options = {})
      default_opts = {:knockout_prefix => "--", :preserve_unmergeables => false}
      DeepMerge::deep_merge!(source, self, default_opts.merge(options))
    end

    # deep_merge! will merge and overwrite any unmergeables in destination hash
    def deep_merge!(source, options = {})
      default_opts = {:preserve_unmergeables => false}
      DeepMerge::deep_merge!(source, self, default_opts.merge(options))
    end
  end # DeepMergeHashExt
end

class Hash
  include DeepMerge::DeepMergeHash
end
