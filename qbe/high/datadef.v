module high

import qbe.low { DataItem, Type }

pub struct DataDefItem {
pub:
	type Type
	item DataItem
}

pub fn (d DataDefItem) str() string {
	return '${d.type} ${d.item}'
}

// Data definition.
pub struct DataDef {
pub:
	// Linkage
	linkage Linkage
	// Name
	name string
	// Alignment
	align ?u64
	// Items
	items []DataDefItem
}

pub fn (d DataDef) str() string {
	mut ret_str := '${d.linkage}data ${d.name} = '

	if align := d.align {
		ret_str += 'align ${align} '
	}

	ret_str += '{ ${d.items.map(it.str()).join(', ')} }'

	return ret_str
}
