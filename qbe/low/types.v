module low

// Type sets the length of a type.
pub enum Type {
	// Base types
	word
	long
	single
	double

	// Extended types
	byte
	signedbyte
	unsignedbyte
	halfword
	signedhalfword
	unsignedhalfword

	// Misc
	zero // Only for use in DataDef
}

pub fn (t Type) str() string {
	return match t {
		.word { 'w' }
		.long { 'l' }
		.single { 's' }
		.double { 'd' }
		.byte { 'b' }
		.signedbyte { 'sb' }
		.unsignedbyte { 'ub' }
		.halfword { 'h' }
		.signedhalfword { 'sh' }
		.unsignedhalfword { 'uh' }
		.zero { 'z' }
	}
}

// Returns the closest base type.
pub fn (t Type) into_base() Type {
	return match t {
		.byte, .signedbyte, .unsignedbyte, .halfword, .unsignedhalfword { .word }
		else { t }
	}
}

// Returns a C ABI type. Extended types are converted to closest base types.
pub fn (t Type) into_abi() Type {
	return match t {
		.byte, .halfword { .word }
		else { t }
	}
}
