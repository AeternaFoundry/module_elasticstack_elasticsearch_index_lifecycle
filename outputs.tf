output "elasticsearch_index_lifecycles_id" {
  description = "Map of id values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no id are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.id if v.id != null && length(v.id) > 0 }
}
output "elasticsearch_index_lifecycles_cold" {
  description = "Map of cold values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no cold are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.cold if v.cold != null && length(v.cold) > 0 }
}
output "elasticsearch_index_lifecycles_delete" {
  description = "Map of delete values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no delete are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.delete if v.delete != null && length(v.delete) > 0 }
}
output "elasticsearch_index_lifecycles_elasticsearch_connection" {
  description = "Map of elasticsearch_connection values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no elasticsearch_connection are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.elasticsearch_connection if v.elasticsearch_connection != null && length(v.elasticsearch_connection) > 0 }
  sensitive   = true
}
output "elasticsearch_index_lifecycles_force_destroy" {
  description = "Map of force_destroy values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no force_destroy are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.force_destroy if v.force_destroy != null }
}
output "elasticsearch_index_lifecycles_frozen" {
  description = "Map of frozen values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no frozen are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.frozen if v.frozen != null && length(v.frozen) > 0 }
}
output "elasticsearch_index_lifecycles_hot" {
  description = "Map of hot values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no hot are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.hot if v.hot != null && length(v.hot) > 0 }
}
output "elasticsearch_index_lifecycles_metadata" {
  description = "Map of metadata values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no metadata are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "elasticsearch_index_lifecycles_modified_date" {
  description = "Map of modified_date values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no modified_date are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.modified_date if v.modified_date != null && length(v.modified_date) > 0 }
}
output "elasticsearch_index_lifecycles_name" {
  description = "Map of name values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no name are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.name if v.name != null && length(v.name) > 0 }
}
output "elasticsearch_index_lifecycles_warm" {
  description = "Map of warm values across all elasticsearch_index_lifecycles, keyed the same as var.elasticsearch_index_lifecycles except keys with no warm are omitted"
  value       = { for k, v in elasticstack_elasticsearch_index_lifecycle.elasticsearch_index_lifecycles : k => v.warm if v.warm != null && length(v.warm) > 0 }
}

