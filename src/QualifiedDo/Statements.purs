-- | This module is intended for internal use.
-- |
-- | Importing this module qualified and using qualified `do` has these results:
-- | ```purescript
-- | import QualifiedDo.Statements as S
-- |
-- | -- Equivalent to: Statements [ a, b, c ]
-- | S.do
-- |   a
-- |   b
-- |   c
-- |
-- | -- Equivalent to: a
-- | S.do
-- |   a
-- | ```
-- | You can use the `Convert` typeclass to make funcitons that accept both
-- | `a` and `Statements a`.
module QualifiedDo.Statements
  ( class Convert
  , convert

  , Statements
  , unStatements

  , bind
  , discard
  ) where

import Prelude

import Data.Array.NonEmpty (NonEmptyArray, singleton)

class Convert a b | a → b where
  convert ∷ a → b

instance Convert (Statements a) (Statements a) where
  convert a = a

else instance Convert a (Statements a) where
  convert a = Statements (singleton a)

newtype Statements a = Statements (NonEmptyArray a)

derive newtype instance Semigroup (Statements a)

unStatements ∷ ∀ a. Statements a → NonEmptyArray a
unStatements (Statements a) = a

bind ∷ ∀ s a. Convert s (Statements a) ⇒ a → (a → s) → Statements a
bind a f = Statements (singleton a) <> convert (f a)

discard ∷ ∀ s a. Convert s (Statements a) ⇒ a → (Unit → s) → Statements a
discard a f = Statements (singleton a) <> convert (f unit)
