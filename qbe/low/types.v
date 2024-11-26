module low

// Type sets the length of a type.
pub enum Type {
	// 32-bit integer
	word
	// 64-bit integer
	long
	// 32-bit float
	single
	// 64-bit float
	double
	// 32-bit integer + extended 8-bits
	wordbyte
	// 64-bit integer + extended 8-bits
	longbyte
	// 32-bit float + extended 8-bits
	singlebyte
	// 64-bit float + extended 8-bits
	doublebyte
	// 32-bit integer + extended 16-bits
	wordhalf
	// 64-bit integer + extended 16-bits
	longhalf
	// 32-bit float + extended 16-bits
	singlehalf
	// 64-bit float + extended 16-bits
	doublehalf
}

pub fn (t Type) str() string {
	return match t {
		.word { 'w' }
		.long { 'l' }
		.single { 's' }
		.double { 'd' }
		.wordbyte { 'wb' }
		.longbyte { 'lb' }
		.singlebyte { 'sb' }
		.doublebyte { 'db' }
		.wordhalf { 'wh' }
		.longhalf { 'lh' }
		.singlehalf { 'sh' }
		.doublehalf { 'dh' }
	}
}
