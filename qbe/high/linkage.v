module high

// Linkage.
pub struct Linkage {
pub:
	// Export status
	exported bool
	// Section
	section ?string
	// Specifies target's section flags
	secflags ?string
}

pub fn (l Linkage) str() string {
	mut ret_str := 'export '

	if section := l.section {
		ret_str += 'section \"${section}\"'
		if secflags := l.secflags {
			ret_str += ' \"${secflags}\"'
		}
		ret_str += ' '
	}
}
