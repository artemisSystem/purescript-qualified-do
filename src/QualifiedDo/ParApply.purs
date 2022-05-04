-- | Use an `Apply`'s `Parallel` instance in an `ado` block. Example:
-- |
-- | ```purescript
-- | import QualifiedDo.ParApply as Par
-- |
-- | -- Equivalent to: (f <$> action1) `parApply` action2
-- | Par.ado
-- |   result1 ← action1
-- |   result2 ← action2
-- |   in f result1 result2
-- | ```
module QualifiedDo.ParApply where

import Control.Parallel (class Parallel, parApply)
import Prelude as P

map ∷ ∀ f a b. P.Functor f ⇒ (a → b) → f a → f b
map = P.map

apply ∷ ∀ f m a b. Parallel f m ⇒ m (a → b) → m a → m b
apply = parApply

pure ∷ ∀ f a. P.Applicative f ⇒ a → f a
pure = P.pure
