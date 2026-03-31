# Architecture

`zide-tree-sitter` is the producer-side repo for Tree-sitter grammar packs and
generic query assets.

## Owns

- grammar fetch/update/build/release tooling
- pack manifest format
- generic query corpora
- generated syntax mapping assets

## Does Not Own

- Zide editor runtime
- query execution in the editor
- app/user/project override policy
- rendering semantics

## Consumer Contract

Primary consumer is `zide`.

The repo should eventually provide:

- built grammar packs under a stable install layout
- query assets by language and query type
- generated syntax mapping assets
- documented local and release workflows

## Current Extracted Surface

The first extracted slice includes:

- `tools/grammar/grammar_update.zig`
- `tools/grammar/grammar_fetch.zig`
- `tools/grammar_packs/**`
- `assets/queries/**`
- `assets/syntax/generated.lua`

The source of truth is still temporarily duplicated in `zide` until consumer
rewiring is done.
