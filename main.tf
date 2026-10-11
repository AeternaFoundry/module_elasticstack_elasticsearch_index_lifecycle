resource "elasticstack_elasticsearch_index_lifecycle" "elasticsearch_index_lifecycles" {
  for_each = var.elasticsearch_index_lifecycles

  name          = each.value.name
  force_destroy = each.value.force_destroy
  metadata      = each.value.metadata
  timeouts      = each.value.timeouts

  dynamic "cold" {
    for_each = each.value.cold != null ? each.value.cold : []
    content {
      dynamic "allocate" {
        for_each = cold.value.allocate != null ? cold.value.allocate : []
        content {
          exclude               = allocate.value.exclude
          include               = allocate.value.include
          number_of_replicas    = allocate.value.number_of_replicas
          require               = allocate.value.require
          total_shards_per_node = allocate.value.total_shards_per_node
        }
      }
      dynamic "downsample" {
        for_each = cold.value.downsample != null ? cold.value.downsample : []
        content {
          fixed_interval = downsample.value.fixed_interval
          wait_timeout   = downsample.value.wait_timeout
        }
      }
      dynamic "freeze" {
        for_each = cold.value.freeze != null ? cold.value.freeze : []
        content {
          enabled = freeze.value.enabled
        }
      }
      dynamic "migrate" {
        for_each = cold.value.migrate != null ? cold.value.migrate : []
        content {
          enabled = migrate.value.enabled
        }
      }
      min_age = cold.value.min_age
      dynamic "readonly" {
        for_each = cold.value.readonly != null ? cold.value.readonly : []
        content {
          enabled = readonly.value.enabled
        }
      }
      dynamic "searchable_snapshot" {
        for_each = cold.value.searchable_snapshot != null ? cold.value.searchable_snapshot : []
        content {
          force_merge_index    = searchable_snapshot.value.force_merge_index
          force_merge_on_clone = searchable_snapshot.value.force_merge_on_clone
          snapshot_repository  = searchable_snapshot.value.snapshot_repository
        }
      }
      dynamic "set_priority" {
        for_each = cold.value.set_priority != null ? cold.value.set_priority : []
        content {
          priority = set_priority.value.priority
        }
      }
      dynamic "unfollow" {
        for_each = cold.value.unfollow != null ? cold.value.unfollow : []
        content {
          enabled = unfollow.value.enabled
        }
      }
    }
  }

  dynamic "delete" {
    for_each = each.value.delete != null ? each.value.delete : []
    content {
      dynamic "delete" {
        for_each = delete.value.delete != null ? delete.value.delete : []
        content {
          delete_searchable_snapshot = delete.value.delete_searchable_snapshot
        }
      }
      min_age = delete.value.min_age
      dynamic "wait_for_snapshot" {
        for_each = delete.value.wait_for_snapshot != null ? delete.value.wait_for_snapshot : []
        content {
          policy = wait_for_snapshot.value.policy
        }
      }
    }
  }

  dynamic "elasticsearch_connection" {
    for_each = each.value.elasticsearch_connection != null ? each.value.elasticsearch_connection : []
    content {
      api_key                  = elasticsearch_connection.value.api_key
      bearer_token             = elasticsearch_connection.value.bearer_token
      ca_data                  = elasticsearch_connection.value.ca_data
      ca_file                  = elasticsearch_connection.value.ca_file
      ca_fingerprint           = elasticsearch_connection.value.ca_fingerprint
      cert_data                = elasticsearch_connection.value.cert_data
      cert_file                = elasticsearch_connection.value.cert_file
      endpoints                = elasticsearch_connection.value.endpoints
      es_client_authentication = elasticsearch_connection.value.es_client_authentication
      headers                  = elasticsearch_connection.value.headers
      insecure                 = elasticsearch_connection.value.insecure
      key_data                 = elasticsearch_connection.value.key_data
      key_file                 = elasticsearch_connection.value.key_file
      password                 = elasticsearch_connection.value.password
      username                 = elasticsearch_connection.value.username
    }
  }

  dynamic "frozen" {
    for_each = each.value.frozen != null ? each.value.frozen : []
    content {
      min_age = frozen.value.min_age
      dynamic "searchable_snapshot" {
        for_each = frozen.value.searchable_snapshot != null ? frozen.value.searchable_snapshot : []
        content {
          force_merge_index    = searchable_snapshot.value.force_merge_index
          force_merge_on_clone = searchable_snapshot.value.force_merge_on_clone
          snapshot_repository  = searchable_snapshot.value.snapshot_repository
        }
      }
    }
  }

  dynamic "hot" {
    for_each = each.value.hot != null ? each.value.hot : []
    content {
      dynamic "downsample" {
        for_each = hot.value.downsample != null ? hot.value.downsample : []
        content {
          fixed_interval = downsample.value.fixed_interval
          wait_timeout   = downsample.value.wait_timeout
        }
      }
      dynamic "forcemerge" {
        for_each = hot.value.forcemerge != null ? hot.value.forcemerge : []
        content {
          index_codec      = forcemerge.value.index_codec
          max_num_segments = forcemerge.value.max_num_segments
        }
      }
      min_age = hot.value.min_age
      dynamic "readonly" {
        for_each = hot.value.readonly != null ? hot.value.readonly : []
        content {
          enabled = readonly.value.enabled
        }
      }
      dynamic "rollover" {
        for_each = hot.value.rollover != null ? hot.value.rollover : []
        content {
          max_age                = rollover.value.max_age
          max_docs               = rollover.value.max_docs
          max_primary_shard_docs = rollover.value.max_primary_shard_docs
          max_primary_shard_size = rollover.value.max_primary_shard_size
          max_size               = rollover.value.max_size
          min_age                = rollover.value.min_age
          min_docs               = rollover.value.min_docs
          min_primary_shard_docs = rollover.value.min_primary_shard_docs
          min_primary_shard_size = rollover.value.min_primary_shard_size
          min_size               = rollover.value.min_size
        }
      }
      dynamic "searchable_snapshot" {
        for_each = hot.value.searchable_snapshot != null ? hot.value.searchable_snapshot : []
        content {
          force_merge_index    = searchable_snapshot.value.force_merge_index
          force_merge_on_clone = searchable_snapshot.value.force_merge_on_clone
          snapshot_repository  = searchable_snapshot.value.snapshot_repository
        }
      }
      dynamic "set_priority" {
        for_each = hot.value.set_priority != null ? hot.value.set_priority : []
        content {
          priority = set_priority.value.priority
        }
      }
      dynamic "shrink" {
        for_each = hot.value.shrink != null ? hot.value.shrink : []
        content {
          allow_write_after_shrink = shrink.value.allow_write_after_shrink
          max_primary_shard_size   = shrink.value.max_primary_shard_size
          number_of_shards         = shrink.value.number_of_shards
        }
      }
      dynamic "unfollow" {
        for_each = hot.value.unfollow != null ? hot.value.unfollow : []
        content {
          enabled = unfollow.value.enabled
        }
      }
    }
  }

  dynamic "warm" {
    for_each = each.value.warm != null ? each.value.warm : []
    content {
      dynamic "allocate" {
        for_each = warm.value.allocate != null ? warm.value.allocate : []
        content {
          exclude               = allocate.value.exclude
          include               = allocate.value.include
          number_of_replicas    = allocate.value.number_of_replicas
          require               = allocate.value.require
          total_shards_per_node = allocate.value.total_shards_per_node
        }
      }
      dynamic "downsample" {
        for_each = warm.value.downsample != null ? warm.value.downsample : []
        content {
          fixed_interval = downsample.value.fixed_interval
          wait_timeout   = downsample.value.wait_timeout
        }
      }
      dynamic "forcemerge" {
        for_each = warm.value.forcemerge != null ? warm.value.forcemerge : []
        content {
          index_codec      = forcemerge.value.index_codec
          max_num_segments = forcemerge.value.max_num_segments
        }
      }
      dynamic "migrate" {
        for_each = warm.value.migrate != null ? warm.value.migrate : []
        content {
          enabled = migrate.value.enabled
        }
      }
      min_age = warm.value.min_age
      dynamic "readonly" {
        for_each = warm.value.readonly != null ? warm.value.readonly : []
        content {
          enabled = readonly.value.enabled
        }
      }
      dynamic "set_priority" {
        for_each = warm.value.set_priority != null ? warm.value.set_priority : []
        content {
          priority = set_priority.value.priority
        }
      }
      dynamic "shrink" {
        for_each = warm.value.shrink != null ? warm.value.shrink : []
        content {
          allow_write_after_shrink = shrink.value.allow_write_after_shrink
          max_primary_shard_size   = shrink.value.max_primary_shard_size
          number_of_shards         = shrink.value.number_of_shards
        }
      }
      dynamic "unfollow" {
        for_each = warm.value.unfollow != null ? warm.value.unfollow : []
        content {
          enabled = unfollow.value.enabled
        }
      }
    }
  }
}

