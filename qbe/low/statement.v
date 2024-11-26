module low

// An IR statement.
pub type Statement = Assign | Volatile

// Assign to value.
pub struct Assign {
pub:
	tmp Value
	t   Type
	i   Instr
}

pub fn (s Statement) str() string {
	return match s {
		Assign { s.str() }
		Volatile { s.str() }
	}
}

pub fn (a Assign) str() string {
	return '${a.tmp} =${a.t} ${a.i}'
}

// Call value without assigning.
pub struct Volatile {
pub:
	i Instr
}

pub fn (v Volatile) str() string {
	return '${v.i}'
}
