-- | Accumulate `do` block entries in a `Semigroup` while mapping over them.
-- | Example:
-- |
-- | ```purescript
-- | import QualifiedDo.FoldMap as F
-- |
-- | -- Equivalent to: foldMap f [a, b, c]
-- | F.foldMap f F.do
-- |   a
-- |   b
-- |   c
-- | ```
module QualifiedDo.FoldMap (foldMap, module Exports) where

import Prelude

import Data.Foldable as Foldable
import QualifiedDo.Statements (bind, discard) as Exports
import QualifiedDo.Statements (class Convert, Statements, convert, unStatements)

foldMap ∷ ∀ a b s. Convert s (Statements a) ⇒ Monoid b ⇒ (a → b) → s → b
foldMap f s = Foldable.foldMap f (unStatements $ convert s)
