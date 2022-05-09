-- | Kleisli compose `do` block entries. Example:
-- |
-- | ```purescript
-- | import QualifiedDo.Kleisli as ComposeK
-- |
-- | -- Equivalent to: a >=> b >=> c
-- | ComposeK.do
-- |   a
-- |   b
-- |   c
-- | ```
module QualifiedDo.Kleisli where

import Prelude

bind ∷ ∀ m a b c. Bind m ⇒ (a → m b) → ((a → m b) → (b → m c)) → (a → m c)
bind a b = a >=> b a

discard ∷ ∀ m a b c. Bind m ⇒ (a → m b) → (Unit → (b → m c)) → (a → m c)
discard a b = a >=> b unit
