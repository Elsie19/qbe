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
	mut ret_str := if l.exported { 'export ' } else { '' }

	if section := l.section {
		ret_str += "section \"${section}\""
		if secflags := l.secflags {
			ret_str += " \"${secflags}\""
		}
		ret_str += ' '
	}

	return ret_str
}

// Returns the default configuration for private linkage.
pub fn Linkage.private() Linkage {
	return Linkage{false, none, none}
}

// Returns the default configuration for public linkage.
pub fn Linkage.public() Linkage {
	return Linkage{true, none, none}
}

// Returns the configuration for private linkage with a provided section.
pub fn Linkage.private_with_section(section string) Linkage {
	return Linkage{false, section, none}
}

// Returns the configuration for public linkage with a provided section.
pub fn Linkage.public_with_section(section string) Linkage {
	return Linkage{true, section, none}
}
