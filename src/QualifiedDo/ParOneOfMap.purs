-- | Accumulate `do` block entries in an `Alt` using its `Parallel` instance
-- | while mapping over them. Example:
-- |
-- | ```purescript
-- | import QualifiedDo.ParOneOfMap as PO
-- |
-- | -- Equivalent to: parOneOfMap f [a, b, c]
-- | PO.parOneOfMap f PO.do
-- |   a
-- |   b
-- |   c
-- | ```
module QualifiedDo.ParOneOfMap (parOneOfMap, module Exports) where

import Prelude

import Control.Alternative (class Alternative)
import Control.Parallel (class Parallel)
import Control.Parallel as Parallel
import QualifiedDo.Statements (bind, discard) as Exports
import QualifiedDo.Statements (class Convert, Statements, convert, unStatements)

parOneOfMap
  ∷ ∀ m f a b s
  . Convert s (Statements a)
  ⇒ Parallel f m
  ⇒ Alternative f
  ⇒ (a → m b)
  → s
  → m b
parOneOfMap f s = Parallel.parOneOfMap f (unStatements $ convert s)
