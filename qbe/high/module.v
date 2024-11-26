module high

// Module.
pub struct Module {
	// Functions
	functions []Function
	// Aggregate types
	types []TypeDef
	// Data definitions
	data []DataDef
}

pub fn (m Module) str() string {
	mut ret_str := m.functions.map(it.str() + '\n')
	ret_str += m.types.map(it.str() + '\n')
	ret_str += m.data.map(it.str() + '\n')
	return ret_str
}
