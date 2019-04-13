#include "../vendor/tree-sitter/lib/include/tree_sitter/api.h"

TSTree *hs_parser_parse(
  TSParser *self,
  const TSTree *old_tree,
  TSInput *input
);

TSTree *hs_parser_parse_string_encoding(
  TSParser *self,
  const TSTree *old_tree,
  const char *string,
  uint32_t length,
  TSInputEncoding *encoding
);

void hs_parser_set_logger(TSParser *self, TSLogger *logger);

TSLogger *hs_parser_logger(const TSParser *self, TSLogger *out);

TSNode *hs_tree_root_node(const TSTree *self, TSNode *out);

void hs_tree_print_dot_graph(const TSTree *self, FILE *file);

const char *hs_node_type(TSNode *self);

TSSymbol hs_node_symbol(TSNode *self);

uint32_t hs_node_start_byte(TSNode *self);

TSPoint *hs_node_start_point(TSNode *self, TSPoint *out);

uint32_t hs_node_end_byte(TSNode *self);

TSPoint *hs_node_end_point(TSNode *self, TSPoint *out);

char *hs_node_string(TSNode *self);

bool hs_node_is_null(TSNode *self);

bool hs_node_is_named(TSNode *self);

bool hs_node_is_missing(TSNode *self);

bool hs_node_has_changes(TSNode *self);

bool hs_node_has_error(TSNode *self);

TSNode *hs_node_parent(TSNode *self, TSNode *out);

TSNode *hs_node_child(TSNode *self, uint32_t child_index, TSNode *out);

uint32_t hs_node_child_count(TSNode *self);

TSNode *hs_node_named_child(TSNode *self, uint32_t child_index, TSNode *out);

uint32_t hs_node_named_child_count(TSNode *self);

TSNode *hs_node_child_by_field_name(
  TSNode *self,
  const char *field_name,
  uint32_t field_name_length,
  TSNode *out);

TSNode *hs_node_child_by_field_id(TSNode *self, TSFieldId field_id, TSNode *out);

TSNode *hs_node_next_sibling(TSNode *self, TSNode *out);

TSNode *hs_node_prev_sibling(TSNode *self, TSNode *out);

TSNode *hs_node_next_named_sibling(TSNode *self, TSNode *out);

TSNode *hs_node_prev_named_sibling(TSNode *self, TSNode *out);

TSNode *hs_node_first_child_for_byte(TSNode *self, uint32_t byte, TSNode *out);

TSNode *hs_node_first_named_child_for_byte(TSNode *self, uint32_t byte, TSNode *out);

TSNode *hs_node_descendant_for_byte_range(TSNode *self, uint32_t min, uint32_t max, TSNode *out);

TSNode *hs_node_descendant_for_point_range(TSNode *self, TSPoint *min, TSPoint *max, TSNode *out);

TSNode *hs_node_named_descendant_for_byte_range(TSNode *self, uint32_t min, uint32_t max, TSNode *out);

TSNode *hs_node_named_descendant_for_point_range(TSNode *self, TSPoint *min, TSPoint *max, TSNode *out);

bool hs_node_eq(TSNode *self, TSNode *other);

TSTreeCursor *hs_tree_cursor_new(TSNode *self, TSTreeCursor *out);

void hs_tree_cursor_reset(TSTreeCursor *self, TSNode *node);

TSNode *hs_tree_cursor_current_node(const TSTreeCursor *self, TSNode *out);
