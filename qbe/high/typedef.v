module high

import qbe.low { Type }

// Implements `SUBTY` from QBE docs.
pub type Items = Type | string

pub fn (i Items) str() string {
	return match i {
		Type { i.str() }
		string { i.str() }
	}
}

// Aggregate type definition.
pub type TypeDef = TypeRegular | TypeUnion | TypeOpaque

pub fn (t TypeDef) str() string {
	mut ret_str := 'type :'
	match t {
		TypeRegular { ret_str += t.str() }
		TypeUnion { ret_str += t.str() }
		TypeOpaque { ret_str += t.str() }
	}
	return ret_str
}

// Regular type.
pub struct TypeRegular {
pub:
	// Name
	ident string
	// Alignment
	align ?u32
	// Subtypes
	subtypes []Items
}

pub fn (t TypeRegular) str() string {
	mut ret_str := '${t.ident} = '
	if align := t.align {
		ret_str += 'align ${align} '
	}

	ret_str += '{ ${t.subtypes.map(it.str()).join(', ')} }'

	return ret_str
}

// Union type.
pub struct TypeUnion {
pub:
	// Name
	ident string
	// Alignment
	align ?u32
	// Subtypes
	subtypes [][]Items
}

pub fn (t TypeUnion) str() string {
	mut ret_str := '${t.ident} = '
	if align := t.align {
		ret_str += 'align ${align} '
	}

	mut groups := []string{}
	for group in t.subtypes {
		mut group_str := []string{}
		for item in group {
			group_str << item.str()
		}
		groups << '{ ' + group_str.join(' ') + ' }'
	}

	ret_str += '{ ${groups.join(' ')} }'

	return ret_str
}

// Opaque type.
pub struct TypeOpaque {
pub:
	// Name
	ident string
	// Alignment
	align u32
	// Size
	size u32
}

pub fn (t TypeOpaque) str() string {
	return '${t.ident} = align ${t.align} { ${t.size} }'
}
