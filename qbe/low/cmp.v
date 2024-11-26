module low

// Compare for operations.
pub enum Cmpr {
	// x < y
	slt
	// x <= y
	sle
	// x > y
	sgt
	// x >= y
	sge
	// x == y
	eq
	// x != y
	ne
}

pub fn (c Cmpr) str() string {
	return match c {
		.slt { 'slt' }
		.sle { 'sle' }
		.sgt { 'sgt' }
		.sge { 'sge' }
		.eq { 'eq' }
		.ne { 'ne' }
	}
}
