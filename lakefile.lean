import Lake
open Lake DSL

package «quantum» {
  -- add package configuration options here
}

lean_lib «Quantum» {
  -- add library configuration options here
}

require Mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "master"

require Cli from git "https://github.com/yatima-inc/Cli.lean" @ "main"

@[default_target]
lean_exe «quantum» {
  root := `Main
}
