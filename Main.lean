import «Quantum»
import Cli

open Cli

open Quantum

def cmd : Cmd := `[Cli|
  quantum; "Quantum computing with Lean"
]

def main (args : List String): IO UInt32 :=
  cmd.verify args
