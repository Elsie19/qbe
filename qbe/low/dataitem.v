module low

// Data definition item.
pub type DataItem = DSymbol | DStr | DConst

pub fn (d DataItem) str() string {
	return match d {
		DSymbol { d.str() }
		DStr { d.str() }
		DConst { d.str() }
	}
}

// Symbol.
@[param]
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
@[param]
pub struct DStr {
pub:
	// String
	string string
}

pub fn (d DStr) str() string {
	return "\"${d.string}\""
}

// Const
@[param]
pub struct DConst {
pub:
	// Value
	val u64
}

pub fn (d DConst) str() string {
	return '${d.val}'
}

// `DataItem` wrapped generator for `DConst`.
pub fn dconst(dc DConst) DataItem {
	return DataItem(DConst {
		val: dc.val
	})
}

// `DataItem` wrapped generator for `DStr`.
pub fn dstr(ds DStr) DataItem {
	return DataItem(DStr {
		string: ds.string
	})
}

// `DataItem` wrapped generator for `DSymbol`.
pub fn dsymbol(ds DSymbol) DataItem {
	return DataItem(DSymbol {
		name: ds.name
		offset: ds.offset
	})
}
