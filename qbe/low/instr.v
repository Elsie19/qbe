module low

// Instructions.
pub type Instr = Add
	| Sub
	| Div
	| Mul
	| Neg
	| Udiv
	| Rem
	| Urem
	| Cmp
	| Or
	| Xor
	| And
	| Sar
	| Shr
	| Shl
	| Copy
	| Ret
	| Jnz
	| Jmp
	| Call
	| Alloc4
	| Alloc8
	| Alloc16
	| Store
	| Load
	| Blit
	| Phi
	| DbgFile
	| DbgLoc
	| VaStart
	| VaArg

pub fn (i Instr) str() string {
	return match i {
		Add { i.str() }
		Sub { i.str() }
		Div { i.str() }
		Mul { i.str() }
		Neg { i.str() }
		Udiv { i.str() }
		Rem { i.str() }
		Urem { i.str() }
		Cmp { i.str() }
		Or { i.str() }
		Xor { i.str() }
		And { i.str() }
		Sar { i.str() }
		Shr { i.str() }
		Shl { i.str() }
		Copy { i.str() }
		Ret { i.str() }
		Jnz { i.str() }
		Jmp { i.str() }
		Call { i.str() }
		Alloc4 { i.str() }
		Alloc8 { i.str() }
		Alloc16 { i.str() }
		Store { i.str() }
		Load { i.str() }
		Blit { i.str() }
		Phi { i.str() }
		DbgFile { i.str() }
		DbgLoc { i.str() }
		VaStart { i.str() }
		VaArg { i.str() }
	}
}

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

// Two's complement negative value.
pub struct Neg {
pub:
	// Value
	v Value
}

pub fn (n Neg) str() string {
	return 'neg ${n.v}'
}

// Unsigned integral division.
pub struct Udiv {
pub:
	// First value
	to Value
	// Second value
	from Value
}

pub fn (u Udiv) str() string {
	return 'udiv ${u.to}, ${u.from}'
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

// Unsigned remainder value of two temporaries from division.
pub struct Urem {
pub:
	// Value to be divided
	to Value
	// Value to be used to divide
	from Value
}

pub fn (u Urem) str() string {
	return 'urem ${u.to}, ${u.from}'
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

// Performs bitwise XOR.
pub struct Xor {
pub:
	// First value
	x Value
	// Second value
	y Value
}

pub fn (x Xor) str() string {
	return 'xor ${x.x}, ${x.y}'
}

// Shift right preserving sign of value.
pub struct Sar {
pub:
	// Shift value `x`
	x Value
	// By amount of `y`
	y Value
}

pub fn (s Sar) str() string {
	return 'sar ${s.x}, ${s.y}'
}

// Shift right filling newly freed bits with zeros.
pub struct Shr {
pub:
	// Shift value `x`
	x Value
	// By amount of `y`
	y Value
}

pub fn (s Shr) str() string {
	return 'shr ${s.x}, ${s.y}'
}

// Shift left.
pub struct Shl {
pub:
	// Shift value `x`
	x Value
	// By amount of `y`
	y Value
}

pub fn (s Shl) str() string {
	return 'shl ${s.x}, ${s.y}'
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
	v ?Value
}

pub fn (p Param) str() string {
	return if value := p.v {
		'${p.t} ${value}'
	} else {
		// Really this should only appear for variadic arguments
		'${p.t}'
	}
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

// Allocate 4-byte aligned area on the stack.
pub struct Alloc4 {
pub:
	// Size
	s u32
}

pub fn (a Alloc4) str() string {
	return 'alloc4 ${a.s}'
}

// Allocate 8-byte aligned area on the stack.
pub struct Alloc8 {
pub:
	// Size
	s u64
}

pub fn (a Alloc8) str() string {
	return 'alloc8 ${a.s}'
}

// Allocate 16-byte aligned area on the stack.
pub struct Alloc16 {
pub:
	// Size
	// TODO: Make this u128 whenever V releases it.
	s u64
}

pub fn (a Alloc16) str() string {
	return 'alloc16 ${a.s}'
}

// Store a value into memory pointed to by destination.
pub struct Store {
pub:
	// Type
	t Type
	// Destination
	d Value
	// Value
	v Value
}

pub fn (s Store) str() string {
	return 'store${s.t} ${s.d}, ${s.v}'
}

// Load a value from memory.
pub struct Load {
pub:
	// Type
	t Type
	// Source
	s Value
}

pub fn (l Load) str() string {
	return 'load${l.t} ${l.s}'
}

// Copy `n` bytes from source address to the destination address.
pub struct Blit {
pub:
	// Source
	s Value
	// Destination
	d Value
	// Bytes
	n u64
}

pub fn (b Blit) str() string {
	return 'blit ${b.s}, ${b.d}, ${b.n}'
}

pub struct PhiParam {
pub:
	// Label to jump to
	l string
	// Value to check
	v Value
}

pub fn (p PhiParam) str() string {
	return '@${p.l} ${p.v}'
}

// Phi instruction.
pub struct Phi {
pub:
	// Variants to check
	inst []PhiParam
}

pub fn (p Phi) str() string {
	return 'phi ${p.inst.map(it.str()).join(', ')}'
}

// Current source file symbol for debugging.
pub struct DbgFile {
pub:
	// File name
	f string
}

pub fn (d DbgFile) str() string {
	return "dbgfile \"${d.f}\""
}

// Current line and column in source file.
pub struct DbgLoc {
pub:
	// Line
	l u64
	// Column
	c ?u64
}

pub fn (d DbgLoc) str() string {
	return if col := d.c {
		'dbgloc ${d.l}, ${col}'
	} else {
		'dbgloc ${d.l}'
	}
}

// Initialize a variable argument list.
pub struct VaStart {
pub:
	// Pointer to list of arguments
	p Value
}

pub fn (v VaStart) str() string {
	return 'vastart ${v.p}'
}

// Fetch next argument argument from variable list.
pub struct VaArg {
pub:
	// Pointer to list of arguments
	p Value
}

pub fn (v VaArg) str() string {
	return 'vaarg ${v.p}'
}
