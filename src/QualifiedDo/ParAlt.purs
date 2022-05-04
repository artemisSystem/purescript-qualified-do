-- | Accumulate `do` block entries in an `Alt`. Example:
-- |
-- | ```purescript
-- | import QualifiedDo.ParAlt as ParAlt
-- |
-- | -- Equivalent to: parOneOf [ a, b, c ]
-- | ParAlt.do
-- |   a
-- |   b
-- |   c
-- | ```
module QualifiedDo.ParAlt (bind, discard) where

import Prelude

import Control.Alt (class Alt, (<|>))
import Control.Parallel (class Parallel, parallel, sequential)

parAlt ∷ ∀ f m a. Parallel f m ⇒ Alt f ⇒ m a → m a → m a
parAlt a b = sequential $ parallel a <|> parallel b

bind ∷ ∀ f m a. Parallel f m ⇒ Alt f ⇒ m a → (Unit → m a) → m a
bind a b = a `parAlt` b unit

discard ∷ ∀ f m a. Parallel f m ⇒ Alt f ⇒ m a → (Unit → m a) → m a
discard a b = a `parAlt` b unit
