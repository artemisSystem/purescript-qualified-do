-- | Accumulate `do` block entries in an `Unfoldable1`. Example:
-- |
-- | ```purescript
-- | import QualifiedDo.Unfoldable as U
-- |
-- | -- Equivalent to: [a, b, c]
-- | U.unfold U.do
-- |   a
-- |   b
-- |   c
-- | ```
module QualifiedDo.Unfoldable (unfold, module Exports) where

import Prelude

import Data.Array.NonEmpty (toUnfoldable1)
import Data.Unfoldable1 (class Unfoldable1)
import QualifiedDo.Statements (bind, discard) as Exports
import QualifiedDo.Statements (class Convert, Statements, convert, unStatements)

unfold ∷ ∀ f a s. Convert s (Statements a) ⇒ Unfoldable1 f ⇒ s → f a
unfold s = toUnfoldable1 (unStatements $ convert s)