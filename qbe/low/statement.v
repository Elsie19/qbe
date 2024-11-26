module low

// An IR statement.
pub type Statement = Assign | Volatile

// Assign to value.
pub struct Assign {
	tmp Value
	t Type
	i Instr
}

pub fn (a Assign) str() string {
	return '${a.tmp} =${a.t} ${a.i}'
}

// Call value without assigning.
pub struct Volatile {
	i Instr
}

pub fn (v Volatile) str() string {
	return '${v.i}'
}
