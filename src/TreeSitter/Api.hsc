{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "tree_sitter/api.h"
module TreeSitter.Api where
import Foreign.Ptr
#strict_import

{- typedef uint16_t TSSymbol; -}
#synonym_t TSSymbol , CUShort
{- typedef uint16_t TSFieldId; -}
#synonym_t TSFieldId , CUShort
{- typedef struct TSLanguage TSLanguage; -}

#opaque_t struct TSLanguage
{- typedef struct TSParser TSParser; -}
#opaque_t struct TSParser
{- typedef struct TSTree TSTree; -}
#opaque_t struct TSTree

{- typedef enum {
            TSInputEncodingUTF8, TSInputEncodingUTF16
        } TSInputEncoding; -}
#integral_t TSInputEncoding
#num TSInputEncodingUTF8
#num TSInputEncodingUTF16
{- typedef enum {
            TSSymbolTypeRegular, TSSymbolTypeAnonymous, TSSymbolTypeAuxiliary
        } TSSymbolType; -}
#integral_t TSSymbolType
#num TSSymbolTypeRegular
#num TSSymbolTypeAnonymous
#num TSSymbolTypeAuxiliary

{- typedef struct {
            uint32_t row; uint32_t column;
        } TSPoint; -}
#starttype TSPoint
#field row , CUInt
#field column , CUInt
#stoptype
{- typedef struct {
            TSPoint start_point;
            TSPoint end_point;
            uint32_t start_byte;
            uint32_t end_byte;
        } TSRange; -}
#starttype TSRange
#field start_point , <TSPoint>
#field end_point , <TSPoint>
#field start_byte , CUInt
#field end_byte , CUInt
#stoptype

{- typedef struct {
            void * payload;
            const char * (* read)(void * payload,
                                  uint32_t byte_index,
                                  TSPoint position,
                                  uint32_t * bytes_read);
            TSInputEncoding encoding;
        } TSInput; -}
#starttype TSInput
#field payload , Ptr ()
#field read , FunPtr (Ptr () -> CUInt -> <TSPoint> -> Ptr CUInt -> CString)
#field encoding , <TSInputEncoding>
#stoptype

{- typedef enum {
            TSLogTypeParse, TSLogTypeLex
        } TSLogType; -}
#integral_t TSLogType
#num TSLogTypeParse
#num TSLogTypeLex
{- typedef struct {
            void * payload;
            void (* log)(void * payload, TSLogType, const char *);
        } TSLogger; -}
#starttype TSLogger
#field payload , Ptr ()
#field log , FunPtr (Ptr () -> <TSLogType> -> CString -> IO ())
#stoptype
{- typedef struct {
            uint32_t start_byte;
            uint32_t old_end_byte;
            uint32_t new_end_byte;
            TSPoint start_point;
            TSPoint old_end_point;
            TSPoint new_end_point;
        } TSInputEdit; -}
#starttype TSInputEdit
#field start_byte , CUInt
#field old_end_byte , CUInt
#field new_end_byte , CUInt
#field start_point , <TSPoint>
#field old_end_point , <TSPoint>
#field new_end_point , <TSPoint>
#stoptype

{- typedef struct {
            uint32_t context[4]; const void * id; const TSTree * tree;
        } TSNode; -}
#starttype TSNode
#array_field context , CUInt
#field id , Ptr ()
#field tree , Ptr <struct TSTree>
#stoptype

{- typedef struct {
            const void * tree; const void * id; uint32_t context[2];
        } TSTreeCursor; -}
#starttype TSTreeCursor
#field tree , Ptr ()
#field id , Ptr ()
#array_field context , CUInt
#stoptype

#ccall ts_parser_new , IO (Ptr <struct TSParser>)
#ccall ts_parser_delete , Ptr <struct TSParser> -> IO ()
#ccall ts_parser_set_language , Ptr <struct TSParser> -> Ptr <struct TSLanguage> -> IO CInt
#ccall ts_parser_language , Ptr <struct TSParser> -> IO (Ptr <struct TSLanguage>)
#ccall ts_parser_set_included_ranges , Ptr <struct TSParser> -> Ptr <TSRange> -> CUInt -> IO ()
#ccall ts_parser_included_ranges , Ptr <struct TSParser> -> Ptr CUInt -> IO (Ptr <TSRange>)
-- #ccall ts_parser_parse , Ptr <struct TSParser> -> Ptr <struct TSTree> -> <TSInput> -> IO (Ptr <struct TSTree>)
#ccall ts_parser_parse_string , Ptr <struct TSParser> -> Ptr <struct TSTree> -> CString -> CUInt -> IO (Ptr <struct TSTree>)
-- #ccall ts_parser_parse_string_encoding , Ptr <struct TSParser> -> Ptr <struct TSTree> -> CString -> CUInt -> <TSInputEncoding> -> IO (Ptr <struct TSTree>)
#ccall ts_parser_reset , Ptr <struct TSParser> -> IO ()
#ccall ts_parser_set_timeout_micros , Ptr <struct TSParser> -> CULong -> IO ()
#ccall ts_parser_timeout_micros , Ptr <struct TSParser> -> IO CULong
#ccall ts_parser_set_cancellation_flag , Ptr <struct TSParser> -> Ptr CSize -> IO ()
#ccall ts_parser_cancellation_flag , Ptr <struct TSParser> -> IO (Ptr CSize)
-- #ccall ts_parser_set_logger , Ptr <struct TSParser> -> <TSLogger> -> IO ()
-- #ccall ts_parser_logger , Ptr <struct TSParser> -> IO <TSLogger>
#ccall ts_parser_print_dot_graphs , Ptr <struct TSParser> -> CInt -> IO ()
#ccall ts_parser_halt_on_error , Ptr <struct TSParser> -> CInt -> IO ()
#ccall ts_tree_copy , Ptr <struct TSTree> -> IO (Ptr <struct TSTree>)
#ccall ts_tree_delete , Ptr <struct TSTree> -> IO ()
-- #ccall ts_tree_root_node , Ptr <struct TSTree> -> IO <TSNode>
#ccall ts_tree_language , Ptr <struct TSTree> -> IO (Ptr <struct TSLanguage>)
#ccall ts_tree_edit , Ptr <struct TSTree> -> Ptr <TSInputEdit> -> IO ()
#ccall ts_tree_get_changed_ranges , Ptr <struct TSTree> -> Ptr <struct TSTree> -> Ptr CUInt -> IO (Ptr <TSRange>)
-- #ccall ts_tree_print_dot_graph , Ptr <struct TSTree> -> Ptr <struct _IO_FILE> -> IO ()
-- #ccall ts_node_type , <TSNode> -> IO CString
-- #ccall ts_node_symbol , <TSNode> -> IO CUShort
-- #ccall ts_node_start_byte , <TSNode> -> IO CUInt
-- #ccall ts_node_start_point , <TSNode> -> IO <TSPoint>
-- #ccall ts_node_end_byte , <TSNode> -> IO CUInt
-- #ccall ts_node_end_point , <TSNode> -> IO <TSPoint>
-- #ccall ts_node_string , <TSNode> -> IO CString
-- #ccall ts_node_is_null , <TSNode> -> IO CInt
-- #ccall ts_node_is_named , <TSNode> -> IO CInt
-- #ccall ts_node_is_missing , <TSNode> -> IO CInt
-- #ccall ts_node_has_changes , <TSNode> -> IO CInt
-- #ccall ts_node_has_error , <TSNode> -> IO CInt
-- #ccall ts_node_parent , <TSNode> -> IO <TSNode>
-- #ccall ts_node_child , <TSNode> -> CUInt -> IO <TSNode>
-- #ccall ts_node_child_count , <TSNode> -> IO CUInt
-- #ccall ts_node_named_child , <TSNode> -> CUInt -> IO <TSNode>
-- #ccall ts_node_named_child_count , <TSNode> -> IO CUInt
-- #ccall ts_node_child_by_field_name , <TSNode> -> CString -> CUInt -> IO <TSNode>
-- #ccall ts_node_child_by_field_id , <TSNode> -> CUShort -> IO <TSNode>
-- #ccall ts_node_next_sibling , <TSNode> -> IO <TSNode>
-- #ccall ts_node_prev_sibling , <TSNode> -> IO <TSNode>
-- #ccall ts_node_next_named_sibling , <TSNode> -> IO <TSNode>
-- #ccall ts_node_prev_named_sibling , <TSNode> -> IO <TSNode>
-- #ccall ts_node_first_child_for_byte , <TSNode> -> CUInt -> IO <TSNode>
-- #ccall ts_node_first_named_child_for_byte , <TSNode> -> CUInt -> IO <TSNode>
-- #ccall ts_node_descendant_for_byte_range , <TSNode> -> CUInt -> CUInt -> IO <TSNode>
-- #ccall ts_node_descendant_for_point_range , <TSNode> -> <TSPoint> -> <TSPoint> -> IO <TSNode>
-- #ccall ts_node_named_descendant_for_byte_range , <TSNode> -> CUInt -> CUInt -> IO <TSNode>
-- #ccall ts_node_named_descendant_for_point_range , <TSNode> -> <TSPoint> -> <TSPoint> -> IO <TSNode>
#ccall ts_node_edit , Ptr <TSNode> -> Ptr <TSInputEdit> -> IO ()
-- #ccall ts_node_eq , <TSNode> -> <TSNode> -> IO CInt
-- #ccall ts_tree_cursor_new , <TSNode> -> IO <TSTreeCursor>
#ccall ts_tree_cursor_delete , Ptr <TSTreeCursor> -> IO ()
-- #ccall ts_tree_cursor_reset , Ptr <TSTreeCursor> -> <TSNode> -> IO ()
-- #ccall ts_tree_cursor_current_node , Ptr <TSTreeCursor> -> IO <TSNode>
#ccall ts_tree_cursor_current_field_name , Ptr <TSTreeCursor> -> IO CString
#ccall ts_tree_cursor_current_field_id , Ptr <TSTreeCursor> -> IO CUShort
#ccall ts_tree_cursor_goto_parent , Ptr <TSTreeCursor> -> IO CInt
#ccall ts_tree_cursor_goto_next_sibling , Ptr <TSTreeCursor> -> IO CInt
#ccall ts_tree_cursor_goto_first_child , Ptr <TSTreeCursor> -> IO CInt
#ccall ts_tree_cursor_goto_first_child_for_byte , Ptr <TSTreeCursor> -> CUInt -> IO CLong
#ccall ts_language_symbol_count , Ptr <struct TSLanguage> -> IO CUInt
#ccall ts_language_symbol_name , Ptr <struct TSLanguage> -> CUShort -> IO CString
#ccall ts_language_symbol_for_name , Ptr <struct TSLanguage> -> CString -> IO CUShort
#ccall ts_language_field_count , Ptr <struct TSLanguage> -> IO CUInt
#ccall ts_language_field_name_for_id , Ptr <struct TSLanguage> -> CUShort -> IO CString
#ccall ts_language_field_id_for_name , Ptr <struct TSLanguage> -> CString -> CUInt -> IO CUShort
#ccall ts_language_symbol_type , Ptr <struct TSLanguage> -> CUShort -> IO <TSSymbolType>
#ccall ts_language_version , Ptr <struct TSLanguage> -> IO CUInt

#ccall hs_parser_parse , Ptr <struct TSParser> -> Ptr <struct TSTree> -> Ptr <TSInput> -> IO (Ptr <struct TSTree>)
#ccall hs_parser_parse_string_encoding , Ptr <struct TSParser> -> Ptr <struct TSTree> -> CString -> CUInt -> Ptr <TSInputEncoding> -> IO (Ptr <struct TSTree>)
#ccall hs_parser_set_logger , Ptr <struct TSParser> -> Ptr <TSLogger> -> IO ()
#ccall hs_parser_logger , Ptr <struct TSParser> -> Ptr <TSLogger> -> IO (Ptr <TSLogger>)
#ccall hs_tree_root_node , Ptr <struct TSTree> -> Ptr <TSNode> -> IO (Ptr <TSNode>)
-- #ccall hs_tree_print_dot_graph , Ptr <struct TSTree> -> Ptr <struct _IO_FILE> -> IO ()
#ccall hs_node_type , Ptr <TSNode> -> IO CString
#ccall hs_node_symbol , Ptr <TSNode> -> IO CUShort
#ccall hs_node_start_byte , Ptr <TSNode> -> IO CUInt
#ccall hs_node_start_point , Ptr <TSNode> -> Ptr <TSPoint> -> IO (Ptr <TSPoint>)
#ccall hs_node_end_byte , Ptr <TSNode> -> IO CUInt
#ccall hs_node_end_point , Ptr <TSNode> -> Ptr <TSPoint> -> IO (Ptr <TSPoint>)
#ccall hs_node_string , Ptr <TSNode> -> IO CString
#ccall hs_node_is_null , Ptr <TSNode> -> IO CInt
#ccall hs_node_is_named , Ptr <TSNode> -> IO CInt
#ccall hs_node_is_missing , Ptr <TSNode> -> IO CInt
#ccall hs_node_has_changes , Ptr <TSNode> -> IO CInt
#ccall hs_node_has_error , Ptr <TSNode> -> IO CInt
#ccall hs_node_parent , Ptr <TSNode> -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_child , Ptr <TSNode> -> CUInt -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_child_count , Ptr <TSNode> -> IO CUInt
#ccall hs_node_named_child , Ptr <TSNode> -> CUInt -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_named_child_count , Ptr <TSNode> -> IO CUInt
#ccall hs_node_child_by_field_name , Ptr <TSNode> -> CString -> CUInt -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_child_by_field_id , Ptr <TSNode> -> CUShort -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_next_sibling , Ptr <TSNode> -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_prev_sibling , Ptr <TSNode> -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_next_named_sibling , Ptr <TSNode> -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_prev_named_sibling , Ptr <TSNode> -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_first_child_for_byte , Ptr <TSNode> -> CUInt -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_first_named_child_for_byte , Ptr <TSNode> -> CUInt -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_descendant_for_byte_range , Ptr <TSNode> -> CUInt -> CUInt -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_descendant_for_point_range , Ptr <TSNode> -> Ptr <TSPoint> -> Ptr <TSPoint> -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_named_descendant_for_byte_range , Ptr <TSNode> -> CUInt -> CUInt -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_named_descendant_for_point_range , Ptr <TSNode> -> Ptr <TSPoint> -> Ptr <TSPoint> -> Ptr <TSNode> -> IO (Ptr <TSNode>)
#ccall hs_node_eq , Ptr <TSNode> -> Ptr <TSNode> -> IO CInt
#ccall hs_tree_cursor_new , Ptr <TSNode> -> Ptr <TSTreeCursor> -> IO (Ptr <TSTreeCursor>)
#ccall hs_tree_cursor_reset , Ptr <TSTreeCursor> -> Ptr <TSNode> -> IO ()
#ccall hs_tree_cursor_current_node , Ptr <TSTreeCursor> -> Ptr <TSNode> -> IO (Ptr <TSNode>)
