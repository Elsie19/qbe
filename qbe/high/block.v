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

// Adds a new instruction to the block.
pub fn (mut b Block) add_instr(instr Instr) {
	b.statements << Statement(Volatile{instr})
}

// Adds a new instruction assigned to a temporary.
pub fn (mut b Block) assign_instr(temp Value, ty Type, instr Instr) {
	b.statements << Statement(Assign{temp, ty.into_base(), instr})
}

pub fn (b Block) jumps() bool {
	if b.statements.len == 0 {
		return false
	}

	last_el := b.statements.last()
	match last_el {
		Assign {
			return false
		}
		Volatile {
			match last_el.i {
				low.Ret { return true }
				low.Jmp { return true }
				low.Jnz { return true }
				else { return false }
			}
		}
	}
}
