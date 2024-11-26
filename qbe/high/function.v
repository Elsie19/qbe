module high

import qbe.low { Instr, Param, Type, Value }

// Function.
pub struct Function {
pub mut:
	// Linkage
	linkage Linkage @[required]
	// Name
	name string @[required]
	// Arguments
	arguments []Param
	// Return type
	return_ty ?Type
	// Blocks
	blocks []Block
}

pub fn (f Function) str() string {
	mut ret_str := '${f.linkage}function'
	if ty := f.return_ty {
		ret_str += ' ${ty}'
	}

	ret_str += ' ${f.name}(${f.arguments.map(it.str()).join(', ')}) {\n'

	for blk in f.blocks {
		ret_str += '${blk}\n'
	}

	ret_str += '}'
	return ret_str
}

pub fn (mut f Function) add_block(label string) &Block {
	block := Block{label, []}
	f.blocks << block
	return &block
}

// Add a new instruction assigned to a temporary.
pub fn (mut f Function) assign_instr(temp Value, ty Type, instr Instr) {
	if f.blocks.len == 0 {
		panic('Last block must be present')
	}
	// For some reason, `mut block := f.blocks.last()` returns a copy I think.
	f.blocks[f.blocks.len - 1].assign_instr(temp, ty, instr)
}

// Add a new instruction to the last block.
pub fn (mut f Function) add_instr(instr Instr) {
	if f.blocks.len == 0 {
		panic('Last block must be present')
	}
	f.blocks[f.blocks.len - 1].add_instr(instr)
}

pub fn Function.new(linkage Linkage, name string, arguments []Param, return_ty ?Type) Function {
	return Function{linkage, name, arguments, return_ty, []}
}
