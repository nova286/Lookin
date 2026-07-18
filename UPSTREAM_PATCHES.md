# Imported Upstream Patches

This fork incorporates selected community pull requests that were not merged by the original project. Imported commits preserve the original author whenever possible. A listed pull request remains unmerged upstream unless its status is updated here.

| Local commits | Upstream pull request | Original commit | Local adaptation |
| --- | --- | --- | --- |
| `7d801b3`, `6711b86` | [hughkli/Lookin#63](https://github.com/hughkli/Lookin/pull/63) | `700efa8a73600ab69f4c17631970850c5e46bd69` | Targets the maintained forks, pins LookinShared, verifies release checksums and signatures, removes quarantine bypass and npm install-time scripts, applies GPL-3.0-only packaging, and builds CLI artifacts in GitHub Actions. |

Large or cross-repository features are ported on dedicated branches instead of being applied directly. Every imported patch must build against the fork's current default branch before it is merged.
