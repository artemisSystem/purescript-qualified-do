-- | Accumulate `do` block entries in an `Alt` while mapping over them. Example:
-- |
-- | ```purescript
-- | import QualifiedDo.OneOfMap as O
-- |
-- | -- Equivalent to: oneOfMap f [a, b, c]
-- | O.oneOfMap f O.do
-- |   a
-- |   b
-- |   c
-- | ```
module QualifiedDo.OneOfMap (oneOfMap, module Exports) where

import Prelude

import Control.Plus (class Plus)
import Data.Foldable as Foldable
import QualifiedDo.Statements (bind, discard) as Exports
import QualifiedDo.Statements (class Convert, Statements, convert, unStatements)

oneOfMap ∷ ∀ f a b s. Convert s (Statements a) ⇒ Plus f ⇒ (a → f b) → s → f b
oneOfMap f s = Foldable.oneOfMap f (unStatements $ convert s)
