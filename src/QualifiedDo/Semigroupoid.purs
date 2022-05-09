-- | Accumulate `do` block entries in a `Semigroupoid`. Example:
-- |
-- | ```purescript
-- | import QualifiedDo.Semigroupoid as Compose
-- |
-- | -- Equivalent to: a >>> b >>> c
-- | Compose.do
-- |   a
-- |   b
-- |   c
-- | ```
module QualifiedDo.Semigroupoid where

import Prelude

bind ∷ ∀ k a b c. Semigroupoid k ⇒ k a b → (k a b → k b c) → k a c
bind a b = a >>> b a

discard ∷ ∀ k a b c. Semigroupoid k ⇒ k a b → (Unit → k b c) → k a c
discard a b = a >>> b unit
