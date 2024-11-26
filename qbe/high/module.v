module high

// Module.
pub struct Module {
pub mut:
	// Functions
	functions []Function
	// Aggregate types
	types []TypeDef
	// Data definitions
	data []DataDef
}

pub fn (m Module) str() string {
	mut ret_str := m.functions.map(it.str() + '\n').join('\n')
	ret_str += m.types.map(it.str() + '\n').join('\n')
	ret_str += m.data.map(it.str() + '\n').join('\n')
	return ret_str.trim_indent()
}

pub fn (mut m Module) add_function(func Function) &Function {
	m.functions << func
	mut last := m.functions.last()
	return &last
}

pub fn (mut m Module) add_data(data DataDef) &DataDef {
	m.data << data
	mut last := m.data.last()
	return &last
}
