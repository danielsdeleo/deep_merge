require 'deep_merge/core'

module DeepMerge
  module RailsCompat
    # ko_deeper_merge! will merge and knockout elements prefixed with DEFAULT_FIELD_KNOCKOUT_PREFIX
    def ko_deeper_merge!(source, options = {})
      default_opts = {:knockout_prefix => "--", :preserve_unmergeables => false}
      DeepMerge::deep_merge!(source, self, default_opts.merge(options))
    end

    # deeper_merge! will merge and overwrite any unmergeables in destination hash
    def deeper_merge!(source, options = {})
      default_opts = {:preserve_unmergeables => false}
      DeepMerge::deep_merge!(source, self, default_opts.merge(options))
    end

    # deeper_merge will merge and skip any unmergeables in destination hash
    def deeper_merge(source, options = {})
      default_opts = {:preserve_unmergeables => true}
      DeepMerge::deep_merge!(source, self, default_opts.merge(options))
    end
  end
end

class Hash
  include ::DeepMerge::RailsCompat
end
