module low

// Wrapper for constants and variables.
pub type Value = Temporary | Global | Const

// Temporary variable type.
pub struct Temporary {
pub:
	// The variable name
	v string @[required]
}

// Global variable type.
pub struct Global {
pub:
	// The variable name
	v string @[required]
}

// Const variable type.
pub struct Const {
pub:
	// The constant value
	v u64 @[required]
}

// Print `Value` as a QBE IR variable. This should correspond roughly with
// <https://c9x.me/compile/doc/il.html#Constants-and-Vals>.
//
// ### Example input->output
//
// |    Input           | Output |
// |:------------------:|:------:|
// | `Temporary{"foo"}` | `%foo` |
// | `Global{"foo"}`    | `$foo` |
// | `Const{64}`        | `64`   |
pub fn (v Value) str() string {
	return match v {
		Temporary { v.str() }
		Global { v.str() }
		Const { v.str() }
	}
}

pub fn (t Temporary) str() string {
	return '%${t.v}'
}

pub fn (g Global) str() string {
	return '\$${g.v}'
}

pub fn (c Const) str() string {
	return '${c.v}'
}
