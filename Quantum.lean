import Mathlib

namespace Quantum

def hello := "quantum"



/-- A complex number z = a + i*b, where i^2 = -1 and a,b : Real
-/
structure Complex where
  a : Real
  b : Real

namespace Complex

def add (z w : Complex) : Complex := {z with a := z.a + w.a, b := z.b + z.b }

def mul (z w : Complex) : Complex := {z with a := z.a * w.a - z.b * w.b, b := z.a*w.b + z.b*w.a }

end Complex

/-- A nummerical complex number
-/
structure ComplexF where
  a : Float
  b : Float

structure QBit where
  a : Complex
  b : Complex

inductive Bit where
  | zero
  | one
  deriving Repr, Inhabited

/-- Simulated QBit state in superposition phi = a|0> + b|1>
-/
structure QState where
  state : Array Complex
  deriving Repr

/-- Quantum State Monad Transformer
-/
abbrev QMT := StateT QState
  deriving Monad, MonadState

def measure (q : QBit) : QMT IO CBit := do
  let r <- IO.random
  

