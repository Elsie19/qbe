module high

// Wrapper for `TypeDef.items`.
pub struct Items {
	type Type
	count usize
}

pub fn (i Items) str() string {
	return if i.count > 1 {
		'${i.type} ${i.count}'
	} else {
		'${i.type}'
	}
}

// Aggregate type definition.
pub struct TypeDef {
pub:
	// Name of type
	name string
	// Alignment
	align ?u64
	// Items
	items []Items
}

pub fn (t TypeDef) str() string {
	mut ret_str := "type :${t.name} = "
	if align := t.align {
		ret_str += "align ${align} "
	}

	ret_str += '\{\{ ${t.items.map(it.str()).join(", ")} \}\}'
}
