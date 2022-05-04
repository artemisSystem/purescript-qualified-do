-- | Accumulate `do` block entries in an `Alt`. Example:
-- |
-- | ```purescript
-- | import QualifiedDo.Alt as Alt
-- |
-- | -- Equivalent to: oneOf [ a, b, c ]
-- | Alt.do
-- |   a
-- |   b
-- |   c
-- | ```
module QualifiedDo.Alt where

import Prelude

import Control.Alt (class Alt, (<|>))

bind ∷ ∀ f a. Alt f ⇒ f a → (Unit → f a) → f a
bind a b = a <|> b unit

discard ∷ ∀ f a. Alt f ⇒ f a → (Unit → f a) → f a
discard a b = a <|> b unit
