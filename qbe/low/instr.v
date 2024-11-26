module low

// Add values of two temporaries.
pub struct Add {
pub:
	// Value to be added to
	to Value
	// Value to be added
	from Value
}

pub fn (a Add) str() string {
	return 'add ${a.to}, ${a.from}'
}

// Subtract values of two temporaries.
pub struct Sub {
pub:
	// Value to be subtracted from
	to Value
	// Value to be subtracted
	from Value
}

pub fn (s Sub) str() string {
	return 'sub ${s.to}, ${s.from}'
}

// Multiply values of two temporaries.
pub struct Mul {
pub:
	// Value to be multiplied to
	to Value
	// Value to be multiplied
	from Value
}

pub fn (m Mul) str() string {
	return 'mul ${m.to}, ${m.from}'
}

// Divide values of two temporaries.
pub struct Div {
pub:
	// Value to be divided
	to Value
	// Value to be used to divide
	from Value
}

pub fn (d Div) str() string {
	return 'div ${d.to}, ${d.from}'
}

// Remainder value of two temporaries from division.
pub struct Rem {
pub:
	// Value to be divided
	to Value
	// Value to be used to divide
	from Value
}

pub fn (r Rem) str() string {
	return 'rem ${r.to}, ${r.from}'
}

// Performs a comparison between values.
pub struct Cmp {
pub:
	// Type of variable
	type Type
	// Comparison type
	cmp Cmpr
	// Lefthand side
	lhs Value
	// Righthand side
	rhs Value
}

pub fn (c Cmp) str() string {
	return 'c${c.cmp}${c.type} ${c.lhs}, ${c.rhs}'
}

// Performs bitwise AND.
pub struct And {
pub:
	// First value
	x Value
	// Second value
	y Value
}

pub fn (a And) str() string {
	return 'and ${a.x}, ${a.y}'
}

// Performs bitwise OR.
pub struct Or {
pub:
	// First value
	x Value
	// Second value
	y Value
}

pub fn (o Or) str() string {
	return 'or ${o.x}, ${o.y}'
}

// Copies temporary or literal.
pub struct Copy {
pub:
	// Value
	x Value
}

pub fn (c Copy) str() string {
	return 'copy ${c.x}'
}

// Return from a function.
pub struct Ret {
pub:
	// Value
	x ?Value
}

pub fn (r Ret) str() string {
	return if x := r.x {
		'ret ${x}'
	} else {
		'ret'
	}
}

// Jump to first label if value is nonzero or second one otherwise.
pub struct Jnz {
pub:
	// Value to check
	v Value
	// First label
	fl string
	// Second label
	sl string
}

pub fn (j Jnz) str() string {
	return 'jnz ${j.v}, @${j.fl}, @${j.sl}'
}

// Jump unconditionally.
pub struct Jmp {
pub:
	// Jump label
	l string
}

pub fn (j Jmp) str() string {
	return 'jmp @${j.l}'
}

// Param wrapper for `Call.a`.
pub struct Param {
pub:
	// The type
	t Type
	// The value
	v Value
}

pub fn (p Param) str() string {
	return '${p.t} ${p.v}'
}

// Call a function.
pub struct Call {
pub:
	// Function name
	f string
	// Arguments
	a []Param
}

pub fn (c Call) str() string {
	return 'call \$${c.f}(${c.a.map(it.str()).join(', ')})'
}
