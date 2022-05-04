-- | Accumulate `do` block entries in a `Semigroup`. Example:
-- |
-- | ```purescript
-- | import QualifiedDo.Semigroup as S
-- |
-- | -- Equivalent to: fold [ a, b, c ]
-- | S.do
-- |   a
-- |   b
-- |   c
-- | ```
module QualifiedDo.Semigroup where

import Prelude

bind ∷ ∀ a. Semigroup a ⇒ a → (Unit → a) → a
bind a b = a <> b unit

discard ∷ ∀ a. Semigroup a ⇒ a → (Unit → a) → a
discard a b = a <> b unit
