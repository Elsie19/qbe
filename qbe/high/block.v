module high

import qbe.low { Assign, Instr, Statement, Type, Value, Volatile }

// Block.
pub struct Block {
pub mut:
	// Label
	label string
	// Statement list
	statements []Statement
}

pub fn (b Block) str() string {
	mut ret_str := '@${b.label}\n'

	ret_str += b.statements.map('\t' + it.str()).join('\n')

	return ret_str
}

pub fn (mut b Block) add_instr(instr Instr) {
	b.statements << Statement(Volatile{instr})
}

pub fn (mut b Block) assign_instr(temp Value, ty Type, instr Instr) {
	b.statements << Statement(Assign{temp, ty.into_base(), instr})
}
