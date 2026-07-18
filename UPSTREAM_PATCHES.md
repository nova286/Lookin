# Imported Upstream Patches

This fork incorporates selected community pull requests that were not merged by the original project. Imported commits preserve the original author whenever possible. A listed pull request remains unmerged upstream unless its status is updated here.

| Local commits | Upstream pull request | Original commit | Local adaptation |
| --- | --- | --- | --- |
| `7d801b3`, `6711b86` | [hughkli/Lookin#63](https://github.com/hughkli/Lookin/pull/63) | `700efa8a73600ab69f4c17631970850c5e46bd69` | Targets the maintained forks, pins LookinShared, verifies release checksums and signatures, removes quarantine bypass and npm install-time scripts, applies GPL-3.0-only packaging, and builds CLI artifacts in GitHub Actions. |
| `codex/upstream-wireless` | [hughkli/Lookin#42](https://github.com/hughkli/Lookin/pull/42) | `02465ec`, `9327cf3`, `faa6f62`, `9e8ff7d`, `9e3b10c` | Paired with `nova286/LookinServer#164`; retains the existing SwiftUI toolbar, generalizes request/push/cancel paths to both Peertalk and wireless channels, bounds authorization lifetime, serializes UI state changes on the main thread, localizes new UI, and removes device-identity logs. Personal signing changes, merge commits, and dependencies on contributor forks were intentionally excluded. |

Large or cross-repository features are ported on dedicated branches instead of being applied directly. Every imported patch must build against the fork's current default branch before it is merged.
