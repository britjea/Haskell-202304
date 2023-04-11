module GHC.TypeNats
  ( -- * Nat Kind
    Natural -- declared in GHC.Num.Natural in package ghc-bignum
  , Nat
    -- * Linking type and value level
  , KnownNat(natSing), natVal, natVal'
  , SomeNat(..)
  , someNatVal
  , sameNat
    -- ** Singleton values
  , SNat
  , pattern SNat
  , fromSNat
  , withSomeSNat
  , withKnownNat

    -- * Functions on type literals
  , type (<=), type (<=?), type (+), type (*), type (^), type (-)
  , CmpNat
  , cmpNat
  , Div, Mod, Log2

  ) where