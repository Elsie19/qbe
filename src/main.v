import qbe.low { Add, Call, Const, DConst, DStr, DataItem, Global, Instr, Param, Ret, Temporary, Type, Value }
import qbe.high { DataDef, DataDefItem, Function, Linkage, Module }

fn generate_add_func(mut le_module Module) {
	mut func := Function.new(Linkage.private(), 'add', [
		Param{Type.word, Value(Temporary{'a'})},
		Param{Type.word, Value(Temporary{'b'})},
	], Type.word)

	func.add_block('start')
	func.assign_instr(Value(Temporary{'c'}), Type.word, Instr(Add{Value(Temporary{'a'}), Value(Temporary{'b'})}))
	func.add_instr(Instr(Ret{Value(Temporary{'c'})}))

	le_module.add_function(func)
}

fn generate_main_func(mut le_module Module) {
	mut func := Function.new(Linkage.public(), 'main', [], Type.word)

	func.add_block('start')
	func.assign_instr(Value(Temporary{'r'}), Type.word, Instr(Call{'add', [
		Param{Type.word, Value(Const{1})},
		Param{Type.word, Value(Const{1})},
	]}))

	func.add_instr(Instr(Call{'printf', [
		Param{Type.long, Value(Global{'fmt'})},
		Param{Type.variadic, none},
		Param{Type.word, Value(Temporary{'r'})},
	]}))
	func.add_instr(Instr(Ret{Value(Const{0})}))

	le_module.add_function(func)
}

fn generate_data(mut le_module Module) {
	items := [
		DataDefItem{Type.byte, DataItem(DStr{'One and one make %d!\\n'})},
		DataDefItem{Type.byte, DataItem(DConst{0})},
	]
	data := DataDef{Linkage.private(), 'fmt', none, items}
	le_module.add_data(data)
}

fn main() {
	mut le_module := Module{}

	generate_add_func(mut &le_module)
	generate_main_func(mut &le_module)
	generate_data(mut &le_module)

	println(le_module)
}
