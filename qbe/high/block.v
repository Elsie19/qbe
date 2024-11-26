module high

// Block.
pub struct Block {
pub:
	// Label
	label string
	// Statement list
	statememts []Statement
}

pub fn (b Block) str() string {
	mut ret_str := '@${b.label}\n'

	ret_str += '${b.statememts.map('\t' + it.str()).join('\n')}'
}
