module high

pub fn (f FunctionArgs) str() string {
	return '${type} ${value}'
}

// Function.
pub struct Function {
pub:
	// Linkage
	linkage Linkage
	// Name
	name string
	// Arguments
	arguments []Param
	// Return type
	return_ty ?Type
	// Blocks
	blocks []Block
}

pub fn (f Function) str() string {
	mut ret_str := '${f.linkage}function'
	if ty := return_ty {
		ret_str += ' ${ty}'
	}

	ret_str += ' ${f.name}(${f.arguments.map(it.str()).join(", ")}) \{\{\n'

	for blk in f.blocks {
		ret_str += '${blk}\n'
	}

	ret_str += '\}\}'
	return ret_str
}
