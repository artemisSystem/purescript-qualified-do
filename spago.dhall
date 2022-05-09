{ name = "qualified-do"
, dependencies =
  [ "arrays"
  , "control"
  , "foldable-traversable"
  , "parallel"
  , "prelude"
  , "unfoldable"
  ]
, license = "MIT"
, repository = "https://github.com/artemisSystem/purescript-qualified-do.git"
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
