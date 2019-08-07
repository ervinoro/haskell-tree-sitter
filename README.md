# haskell-tree-sitter

Alternative Haskell bindings to the [Tree-sitter](http://tree-sitter.github.io/tree-sitter/) parsing library.

These bindings do not strive to provide a native Haskell experience, and instead focus on making the full C API of Tree-
sitter accessible. Most of the heavy lifting is done by [bindings-DSL](http://hackage.haskell.org/package/bindings-DSL)
directly. The only exception is that for each ts_<>() function that wants struct as value, a hs_<>() function has been
created that takes the same struct as pointer, since [GHC does not support passing structures as values](https://wiki.haskell.org/Foreign_Function_Interface#Foreign_types).

## Setup

You probably want to add it as a submodule in your repo and as a package in your stack config file.

You'll also need to obtain the Tree-sitter compatible grammar for your language.

## Basic usage

    import TreeSitter.Api
    ...

    foreign import ccall unsafe "vendor/tree-sitter-<yourlanguage>/src/parser.c tree_sitter_<yourlanguage>" c'tree_sitter_<yourlanguage> :: Ptr C'TSLanguage

    parse :: String -> ...
    parse s =  alloca $ \root_node -> do
        parser <- c'ts_parser_new
        c'ts_parser_set_language parser c'tree_sitter_<yourlanguage>

        (str, len) <- newCStringLen s
        tree <- c'ts_parser_parse_string parser nullPtr str (fromIntegral len)
        c'hs_tree_root_node tree root_node

        ...
