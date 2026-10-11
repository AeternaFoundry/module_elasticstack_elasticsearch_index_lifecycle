variable "elasticsearch_index_lifecycles" {
  description = <<EOT
Map of elasticsearch_index_lifecycles, attributes below
Required:
    - name
Optional:
    - force_destroy
    - metadata
    - timeouts
    - cold (block):
        - allocate (optional, block):
            - exclude (optional)
            - include (optional)
            - number_of_replicas (optional)
            - require (optional)
            - total_shards_per_node (optional)
        - downsample (optional, block):
            - fixed_interval (optional)
            - wait_timeout (optional)
        - freeze (optional, block):
            - enabled (optional)
        - migrate (optional, block):
            - enabled (optional)
        - min_age (optional)
        - readonly (optional, block):
            - enabled (optional)
        - searchable_snapshot (optional, block):
            - force_merge_index (optional)
            - force_merge_on_clone (optional)
            - snapshot_repository (optional)
        - set_priority (optional, block):
            - priority (optional)
        - unfollow (optional, block):
            - enabled (optional)
    - delete (block):
        - delete (optional, block):
            - delete_searchable_snapshot (optional)
        - min_age (optional)
        - wait_for_snapshot (optional, block):
            - policy (optional)
    - elasticsearch_connection (block):
        - api_key (optional)
        - bearer_token (optional)
        - ca_data (optional)
        - ca_file (optional)
        - ca_fingerprint (optional)
        - cert_data (optional)
        - cert_file (optional)
        - endpoints (optional)
        - es_client_authentication (optional)
        - headers (optional)
        - insecure (optional)
        - key_data (optional)
        - key_file (optional)
        - password (optional)
        - username (optional)
    - frozen (block):
        - min_age (optional)
        - searchable_snapshot (optional, block):
            - force_merge_index (optional)
            - force_merge_on_clone (optional)
            - snapshot_repository (optional)
    - hot (block):
        - downsample (optional, block):
            - fixed_interval (optional)
            - wait_timeout (optional)
        - forcemerge (optional, block):
            - index_codec (optional)
            - max_num_segments (optional)
        - min_age (optional)
        - readonly (optional, block):
            - enabled (optional)
        - rollover (optional, block):
            - max_age (optional)
            - max_docs (optional)
            - max_primary_shard_docs (optional)
            - max_primary_shard_size (optional)
            - max_size (optional)
            - min_age (optional)
            - min_docs (optional)
            - min_primary_shard_docs (optional)
            - min_primary_shard_size (optional)
            - min_size (optional)
        - searchable_snapshot (optional, block):
            - force_merge_index (optional)
            - force_merge_on_clone (optional)
            - snapshot_repository (optional)
        - set_priority (optional, block):
            - priority (optional)
        - shrink (optional, block):
            - allow_write_after_shrink (optional)
            - max_primary_shard_size (optional)
            - number_of_shards (optional)
        - unfollow (optional, block):
            - enabled (optional)
    - warm (block):
        - allocate (optional, block):
            - exclude (optional)
            - include (optional)
            - number_of_replicas (optional)
            - require (optional)
            - total_shards_per_node (optional)
        - downsample (optional, block):
            - fixed_interval (optional)
            - wait_timeout (optional)
        - forcemerge (optional, block):
            - index_codec (optional)
            - max_num_segments (optional)
        - migrate (optional, block):
            - enabled (optional)
        - min_age (optional)
        - readonly (optional, block):
            - enabled (optional)
        - set_priority (optional, block):
            - priority (optional)
        - shrink (optional, block):
            - allow_write_after_shrink (optional)
            - max_primary_shard_size (optional)
            - number_of_shards (optional)
        - unfollow (optional, block):
            - enabled (optional)
EOT

  type = map(object({
    name          = string
    force_destroy = optional(bool)
    metadata      = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
    cold = optional(list(object({
      allocate = optional(list(object({
        exclude               = optional(string)
        include               = optional(string)
        number_of_replicas    = optional(number)
        require               = optional(string)
        total_shards_per_node = optional(number)
      })))
      downsample = optional(list(object({
        fixed_interval = optional(string)
        wait_timeout   = optional(string)
      })))
      freeze = optional(list(object({
        enabled = optional(bool)
      })))
      migrate = optional(list(object({
        enabled = optional(bool)
      })))
      min_age = optional(string)
      readonly = optional(list(object({
        enabled = optional(bool)
      })))
      searchable_snapshot = optional(list(object({
        force_merge_index    = optional(bool)
        force_merge_on_clone = optional(bool)
        snapshot_repository  = optional(string)
      })))
      set_priority = optional(list(object({
        priority = optional(number)
      })))
      unfollow = optional(list(object({
        enabled = optional(bool)
      })))
    })))
    delete = optional(list(object({
      delete = optional(list(object({
        delete_searchable_snapshot = optional(bool)
      })))
      min_age = optional(string)
      wait_for_snapshot = optional(list(object({
        policy = optional(string)
      })))
    })))
    elasticsearch_connection = optional(list(object({
      api_key                  = optional(string)
      bearer_token             = optional(string)
      ca_data                  = optional(string)
      ca_file                  = optional(string)
      ca_fingerprint           = optional(string)
      cert_data                = optional(string)
      cert_file                = optional(string)
      endpoints                = optional(list(string))
      es_client_authentication = optional(string)
      headers                  = optional(map(string))
      insecure                 = optional(bool)
      key_data                 = optional(string)
      key_file                 = optional(string)
      password                 = optional(string)
      username                 = optional(string)
    })))
    frozen = optional(list(object({
      min_age = optional(string)
      searchable_snapshot = optional(list(object({
        force_merge_index    = optional(bool)
        force_merge_on_clone = optional(bool)
        snapshot_repository  = optional(string)
      })))
    })))
    hot = optional(list(object({
      downsample = optional(list(object({
        fixed_interval = optional(string)
        wait_timeout   = optional(string)
      })))
      forcemerge = optional(list(object({
        index_codec      = optional(string)
        max_num_segments = optional(number)
      })))
      min_age = optional(string)
      readonly = optional(list(object({
        enabled = optional(bool)
      })))
      rollover = optional(list(object({
        max_age                = optional(string)
        max_docs               = optional(number)
        max_primary_shard_docs = optional(number)
        max_primary_shard_size = optional(string)
        max_size               = optional(string)
        min_age                = optional(string)
        min_docs               = optional(number)
        min_primary_shard_docs = optional(number)
        min_primary_shard_size = optional(string)
        min_size               = optional(string)
      })))
      searchable_snapshot = optional(list(object({
        force_merge_index    = optional(bool)
        force_merge_on_clone = optional(bool)
        snapshot_repository  = optional(string)
      })))
      set_priority = optional(list(object({
        priority = optional(number)
      })))
      shrink = optional(list(object({
        allow_write_after_shrink = optional(bool)
        max_primary_shard_size   = optional(string)
        number_of_shards         = optional(number)
      })))
      unfollow = optional(list(object({
        enabled = optional(bool)
      })))
    })))
    warm = optional(list(object({
      allocate = optional(list(object({
        exclude               = optional(string)
        include               = optional(string)
        number_of_replicas    = optional(number)
        require               = optional(string)
        total_shards_per_node = optional(number)
      })))
      downsample = optional(list(object({
        fixed_interval = optional(string)
        wait_timeout   = optional(string)
      })))
      forcemerge = optional(list(object({
        index_codec      = optional(string)
        max_num_segments = optional(number)
      })))
      migrate = optional(list(object({
        enabled = optional(bool)
      })))
      min_age = optional(string)
      readonly = optional(list(object({
        enabled = optional(bool)
      })))
      set_priority = optional(list(object({
        priority = optional(number)
      })))
      shrink = optional(list(object({
        allow_write_after_shrink = optional(bool)
        max_primary_shard_size   = optional(string)
        number_of_shards         = optional(number)
      })))
      unfollow = optional(list(object({
        enabled = optional(bool)
      })))
    })))
  }))
}

