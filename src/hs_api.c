#include "tree_sitter/api.h"
#include "hs_api.h"

TSTree *hs_parser_parse(
  TSParser *self,
  const TSTree *old_tree,
  TSInput *input
) {
  return ts_parser_parse(self, old_tree, *input);
}

TSTree *hs_parser_parse_string_encoding(
  TSParser *self,
  const TSTree *old_tree,
  const char *string,
  uint32_t length,
  TSInputEncoding *encoding
) {
  return ts_parser_parse_string_encoding(self, old_tree, string, length, *encoding);
}

void hs_parser_set_logger(TSParser *self, TSLogger *logger) {
  return ts_parser_set_logger(self, *logger);
}

TSLogger *hs_parser_logger(const TSParser *self, TSLogger *out) {
  *out = ts_parser_logger(self);
  return out;
}

TSNode *hs_tree_root_node(const TSTree *self, TSNode *out) {
  *out = ts_tree_root_node(self);
  return out;
}

void hs_tree_print_dot_graph(const TSTree *self, FILE *file) {
  return ts_tree_print_dot_graph(self, file);
}

const char *hs_node_type(TSNode *self) {
  return ts_node_type(*self);
}

TSSymbol hs_node_symbol(TSNode *self) {
  return ts_node_symbol(*self);
}

uint32_t hs_node_start_byte(TSNode *self) {
  return ts_node_start_byte(*self);
}

TSPoint *hs_node_start_point(TSNode *self, TSPoint *out) {
  *out = ts_node_start_point(*self);
  return out;
}

uint32_t hs_node_end_byte(TSNode *self) {
  return ts_node_end_byte(*self);
}

TSPoint *hs_node_end_point(TSNode *self, TSPoint *out) {
  *out = ts_node_end_point(*self);
  return out;
}

char *hs_node_string(TSNode *self) {
  return ts_node_string(*self);
}

bool hs_node_is_null(TSNode *self) {
  return ts_node_is_null(*self);
}

bool hs_node_is_named(TSNode *self) {
  return ts_node_is_named(*self);
}

bool hs_node_is_missing(TSNode *self) {
  return ts_node_is_missing(*self);
}

bool hs_node_has_changes(TSNode *self) {
  return ts_node_has_changes(*self);
}

bool hs_node_has_error(TSNode *self) {
  return ts_node_has_error(*self);
}

TSNode *hs_node_parent(TSNode *self, TSNode *out) {
  *out = ts_node_parent(*self);
  return out;
}

TSNode *hs_node_child(TSNode *self, uint32_t child_index, TSNode *out) {
  *out = ts_node_child(*self, child_index);
  return out;
}

uint32_t hs_node_child_count(TSNode *self) {
  return ts_node_child_count(*self);
}

TSNode *hs_node_named_child(TSNode *self, uint32_t child_index, TSNode *out) {
  *out = ts_node_named_child(*self, child_index);
  return out;
}

uint32_t hs_node_named_child_count(TSNode *self) {
  return ts_node_named_child_count(*self);
}

TSNode *hs_node_child_by_field_name(
  TSNode *self,
  const char *field_name,
  uint32_t field_name_length
, TSNode *out) {
  *out = ts_node_child_by_field_name(*self, field_name, field_name_length);
  return out;
}

TSNode *hs_node_child_by_field_id(TSNode *self, TSFieldId field_id, TSNode *out) {
  *out = ts_node_child_by_field_id(*self, field_id);
  return out;
}

TSNode *hs_node_next_sibling(TSNode *self, TSNode *out) {
  *out = ts_node_next_sibling(*self);
  return out;
}

TSNode *hs_node_prev_sibling(TSNode *self, TSNode *out) {
  *out = ts_node_prev_sibling(*self);
  return out;
}

TSNode *hs_node_next_named_sibling(TSNode *self, TSNode *out) {
  *out = ts_node_next_named_sibling(*self);
  return out;
}

TSNode *hs_node_prev_named_sibling(TSNode *self, TSNode *out) {
  *out = ts_node_prev_named_sibling(*self);
  return out;
}

TSNode *hs_node_first_child_for_byte(TSNode *self, uint32_t byte, TSNode *out) {
  *out = ts_node_first_child_for_byte(*self, byte);
  return out;
}

TSNode *hs_node_first_named_child_for_byte(TSNode *self, uint32_t byte, TSNode *out) {
  *out = ts_node_first_named_child_for_byte(*self, byte);
  return out;
}

TSNode *hs_node_descendant_for_byte_range(TSNode *self, uint32_t min, uint32_t max, TSNode *out) {
  *out = ts_node_descendant_for_byte_range(*self, min, max);
  return out;
}

TSNode *hs_node_descendant_for_point_range(TSNode *self, TSPoint *min, TSPoint *max, TSNode *out) {
  *out = ts_node_descendant_for_point_range(*self, *min, *max);
  return out;
}

TSNode *hs_node_named_descendant_for_byte_range(TSNode *self, uint32_t min, uint32_t max, TSNode *out) {
  *out = ts_node_named_descendant_for_byte_range(*self, min, max);
  return out;
}

TSNode *hs_node_named_descendant_for_point_range(TSNode *self, TSPoint *min, TSPoint *max, TSNode *out) {
  *out = ts_node_named_descendant_for_point_range(*self, *min, *max);
  return out;
}

bool hs_node_eq(TSNode *self, TSNode *other) {
  return ts_node_eq(*self, *other);
}

TSTreeCursor *hs_tree_cursor_new(TSNode *self, TSTreeCursor *out) {
  *out = ts_tree_cursor_new(*self);
  return out;
}

void hs_tree_cursor_reset(TSTreeCursor *self, TSNode *node) {
  return ts_tree_cursor_reset(self, *node);
}

TSNode *hs_tree_cursor_current_node(const TSTreeCursor *self, TSNode *out) {
  *out = ts_tree_cursor_current_node(self);
  return out;
}
