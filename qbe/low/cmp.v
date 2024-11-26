module low

// Compare for operations.
pub enum Cmpr {
	// Integer comparisons
	eq
	ne
	sle
	slt
	sge
	sgt
	ule
	uge
	ugt
	// Floating-point comparisons
	le
	lt
	ge
	gt
	o
	uo
}

pub fn (c Cmpr) str() string {
	return match c {
		.slt { 'slt' }
		.sle { 'sle' }
		.sgt { 'sgt' }
		.sge { 'sge' }
		.eq { 'eq' }
		.ne { 'ne' }
		.le { 'le' }
		.lt { 'lt' }
		.ge { 'ge' }
		.gt { 'gt' }
		.o { 'o' }
		.uo { 'uo' }
	}
}
