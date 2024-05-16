# DeepMerge

[![Gem Version](https://badge.fury.io/rb/deep_merge.svg)](http://badge.fury.io/rb/deep_merge)
[![CI](https://github.com/danielsdeleo/deep_merge/actions/workflows/ci.yaml/badge.svg)](https://github.com/danielsdeleo/deep_merge/actions/workflows/ci.yaml)

Deep Merge is a simple set of utility functions for Hash. It permits you to merge elements inside a hash together recursively. The manner by which it does this is somewhat arbitrary (since there is no defining standard for this) but it should end up being pretty intuitive and do what you expect.

You can learn a lot more about this by reading the test file. It's pretty well documented and has many examples of various merges from very simple to pretty complex.

The primary need that caused me to write this library is the merging of elements coming from HTTP parameters and related stored parameters in session. This lets a user build up a set of parameters over time, modifying individual items.

## DeepMerge Core Documentation

The `deep_merge!` method permits merging of arbitrary child elements. The two top level elements must be hashes. These hashes can contain unlimited (to stack limit) levels of child elements. These child elements do not have to be of the same type. Where child elements are of the same type, `deep_merge` will attempt to merge them together. Where child elements are not of the same type, `deep_merge` will skip or optionally overwrite the destination element with the contents of the source element at that level. For example,

```ruby
source = {:x => [4, 5, '6'], :y => 2}
dest   = {:x => [1, 2, 3],   :y => [7, 8, 9]}
dest.deep_merge!(source)
# => {:x => [1, 2, 3, 4, 5, '6'], :y => 2}
```

By default, `deep_merge!` will overwrite any unmergeables and merge everything else. To avoid this, use `deep_merge` (no bang/exclamation mark).

### Options

Options are specified in the last parameter passed, which should be in hash format

```ruby
hash.deep_merge!({:x => [1, 2]}, {:knockout_prefix => '--'})
```

| Option                                               | Default | Description |
| ------                                               | ------- | ----------- |
| `:preserve_unmergeables`                             | `false` | Set to true to skip any unmergeable elements from source                           |
| [`:knockout_prefix`](#knockout_prefix)               | `nil`   | Set to string value to signify prefix which deletes elements from existing element |
| [`:overwrite_arrays`](#overwrite_arrays)             | `false` | Set to true if you want to avoid merging arrays                                    |
| [`:unpack_arrays`](#unpack_arrays)                   | `nil`   | Set to string value to run `Array.join` then `String.split` against all arrays     |
| `:sort_merged_arrays`                                | `false` | Set to true to sort all arrays that are merged together                            |
| [`:merge_hash_arrays`](#merge_hash_arrays)           | `false` | Set to true to merge hashes within arrays                                          |
| [`:extend_existing_arrays`](#extend_existing_arrays) | `false` | Set to true to extend existing arrays, instead of overwriting them                 |
| [`:keep_array_duplicates`](#keep_array_duplicates)   | `false` | Set to true to keep duplicate entries in arrays, instead of coalescing them        |
| [`:merge_nil_values`](#merge_nil_values)             | `false` | Set to true to merge nil hash values, overwriting a possibly non-nil value         |
| `:merge_debug`                                       | `false` | Set to true to get console output of merge process for debugging                   |

#### `:knockout_prefix`

Provides a way to remove elements from an existing Hash by specifying them in a special way in the incoming hash.

```ruby
source = {:x => ['--1', '3']}
dest   = {:x => ['1', '2']}
dest.deep_merge!(source, :knockout_prefix => "--")
# => {:x => ['2', '3']}
```

Additionally, if the knockout_prefix is passed alone as a string, it will cause the entire element to be removed.

```ruby
source = {:x => '--'}
dest   = {:x => [1, 2, 3]}
dest.deep_merge!(source, :knockout_prefix => "--")
# => {:x => ""}
```

Note that the method `ko_deep_merge!` defaults the knockout prefix to `"--"` for convenience.

```ruby
source = {:x => ['--1', '3']}
dest   = {:x => ['1', '2']}
dest.ko_deep_merge!(source)
# => {:x => ['2', '3']}
```

#### `:overwrite_arrays`

Provides a way to replace Arrays instead of having them merge together.

```ruby
source = {:x => ['1', '2']}
dest   = {:x => ['3', '4']}
dest.deep_merge!(source, :overwrite_arrays => true)
# => {:x => ['1', '2']}
```

#### `:unpack_arrays`

Permits compound elements to be passed in as strings and to be converted into discrete array elements.

```ruby
source = {:x => ['5', '6', '7,8']}
dest   = {:x => ['1,2,3', '4']}
dest.deep_merge!(source, :unpack_arrays => ',')
# => {:x => ['1', '2', '3', '4', '5', '6', '7', '8'}
```

The original purpose for this option is when receiving data from an HTML form, this makes it easy for a checkbox to pass multiple values from within a single HTML element.

#### `:merge_hash_arrays`

Merges hashes within arrays.

```ruby
source = {:x => [{:z => 2}]}
dest   = {:x => [{:y => 1}]}
dest.deep_merge!(source, :merge_hash_arrays => true)
# => {:x => [{:y => 1, :z => 2}]}
```

#### `:extend_existing_arrays`

Adds source elements to existing arrays, instead of overwriting them.

```ruby
source = {:x => "4" }
dest   = {:x => ["1", "2", "3"]}
dest.deep_merge!(source, :extend_existing_arrays => true)
# => {:x => ["1", "2", "3", "4"]}
```

#### `:keep_array_duplicates`

Keeps duplicate entries in arrays, instead of coalescing them.

By default, without this option, duplicate entries are coalesced.

```ruby
source = {:x => ["2", "3"]}
dest   = {:x => ["1", "2"]}
dest.deep_merge!(source)
# => {:x => ["1", "2", "3"]}
```

With this option they are kept.

```ruby
source = {:x => ["2", "3"]}
dest   = {:x => ["1", "2"]}
dest.deep_merge!(source, :keep_array_duplicates => true)
# => {:x => ["1", "2", "2", "3"]}
```

#### `:merge_nil_values`

Allows nil hash values to be merged.

By default, without this option, nil hash values in the source are ignored.

```ruby
source = {:x => nil}
dest   = {:x => "1"}
dest.deep_merge!(source)
# => {:x => "1"}
```

With this option, nil values will overwrite existing values.

```ruby
source = {:x => nil}
dest   = {:x => "1"}
dest.deep_merge!(source, :merge_nil_values => true)
# => {:x => nil}
```

## Using deep_merge in Rails

To avoid conflict with ActiveSupport, load deep_merge via:

    require 'deep_merge/rails_compat'

In a Gemfile:

    gem "deep_merge", :require => 'deep_merge/rails_compat'

The deep_merge methods will then be defined as

    Hash#deeper_merge!
    Hash#ko_deeper_merge!

## Availability

`deep_merge` was written by Steve Midgley, and is now maintained by Daniel DeLeo. The official home of `deep_merge` on the internet is now https://github.com/danielsdeleo/deep_merge

## License

Copyright (c) 2008-2016 Steve Midgley, released under the MIT license
