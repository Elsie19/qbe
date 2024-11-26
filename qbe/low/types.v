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
	}
}

pub fn (t Type) into_base() Type {
	return match t {
		.byte, .signedbyte, .unsignedbyte, .halfword, .unsignedhalfword { .word }
		else { t }
	}
}
