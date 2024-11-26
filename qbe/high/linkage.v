module high

// How linking is handled.
pub enum LinkageFlag {
	// Functions compiled by QBE and called from C need this.
	exported
	// Thread-local storage. Can *only* be used on data definitions.
	threaded
}

// Linkage.
pub struct Linkage {
pub:
	// Export status
	exported ?LinkageFlag
	// Section
	section ?string
	// Specifies target's section flags
	secflags ?string
}

pub fn (l Linkage) str() string {
	mut ret_str := if ty := l.exported {
		match ty {
			.exported { 'export ' }
			.threaded { 'thread ' }
		}
	} else {
		''
	}

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
	return Linkage{none, none, none}
}

// Returns the default configuration for public linkage.
pub fn Linkage.public() Linkage {
	return Linkage{LinkageFlag.exported, none, none}
}

// Returns the default configuration for private linkage with threading.
pub fn Linkage.private_with_threading() Linkage {
	return Linkage{LinkageFlag.threaded, none, none}
}

// Returns the configuration for private linkage with a provided section.
pub fn Linkage.private_with_section(section string) Linkage {
	return Linkage{none, section, none}
}

// Returns the configuration for public linkage with a provided section.
pub fn Linkage.public_with_section(section string) Linkage {
	return Linkage{LinkageFlag.exported, section, none}
}
