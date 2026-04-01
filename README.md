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

Initial producer repo is live. `zide` now consumes grammar tooling through this
repo and resolves shared query/mapping assets through the installed
`tree-sitter-assets` root instead of owning mirrored copies.

Authoritative split lives in:

- `zide`: `app_architecture/editor/TREE_SITTER_REPO_BOUNDARY.md`

## Near-term plan

1. Tighten and document the installed consumer contract.
2. Add release packaging once the contract is stable.
3. Expand tests around asset production and consumer resolution.
4. Consider versioned/pinned consumption outside local sibling development.

## Consumer Layout

Default installed layout:

```text
Windows:
  %LOCALAPPDATA%/Zide/grammars/
  %LOCALAPPDATA%/Zide/tree-sitter-assets/

Elsewhere:
  ~/.config/zide/grammars/
  ~/.config/zide/tree-sitter-assets/
```

`zig build grammar-update` from `zide` proxies into this repo and refreshes that
installed layout.
