module low

// Data definition item.
pub type DataItem = DSymbol | DStr | DConst

// Symbol.
pub struct DSymbol {
pub:
	// Name of symbol
	name string
	// Offset
	offset ?u64
}

pub fn (d DSymbol) str() string {
	return if off := d.offset {
		'${d.name} +${off}'
	} else {
		'${d.name}'
	}
}

// String
pub struct DStr {
pub:
	// String
	string string
}

pub fn (d DStr) str() string {
	return '\"${d.string}\"'
}

// Const
pub struct DConst {
pub:
	// Value
	val u64
}

pub fn (d DConst) str() string {
	return '${d.val}'
}
