# zide-tree-sitter

Shared Tree-sitter grammar-pack tooling and assets for Zide and future consumers.

## Scope

This repo owns:

- grammar sync/fetch/update tooling
- grammar-pack build/release flow
- generic shipped query assets
- generated syntax mapping assets
- pack format and manifest contract

This repo does not own:

- editor runtime execution
- highlight rendering behavior
- app/user/project override policy
- widget or host integration

Those stay in `zide`.

## Layout

- `tools/grammar/`
  - Zig entrypoints for grammar update/fetch/install workflows
- `tools/grammar_packs/`
  - scripts, config, dist/work conventions, release flow
- `assets/queries/`
  - generic shipped query corpora
- `assets/syntax/`
  - generated syntax mapping assets for consumers
- `docs/`
  - contract and release/setup docs

## Status

Initial extraction scaffold. This repo now contains the current producer-side
grammar tooling and generic query/mapping assets copied from `zide`, but `zide`
has not been rewired to consume them from here yet.

Authoritative split lives in:

- `zide`: `app_architecture/editor/TREE_SITTER_REPO_BOUNDARY.md`

## Near-term plan

1. Rewire `zide` to consume grammar tooling/assets through this repo's contract.
2. Remove duplicated producer ownership from `zide`.
3. Document local co-development and release flow.
4. Add release packaging once the consumer contract is stable.
