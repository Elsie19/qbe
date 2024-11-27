import qbe.low { Add, Call, Param, Ret, Type, constant, dconst, dstr, global, temporary }
import qbe.high { DataDef, DataDefItem, Function, Linkage, Module }

fn generate_add_func(mut le_module Module) {
	mut func := Function.new(Linkage.private(), 'add', [
		Param{Type.word, temporary(name: 'a')},
		Param{Type.word, temporary(name: 'b')},
	], Type.word)

	func.add_block('start')
	func.assign_instr(temporary(name: 'c'), Type.word, Add{temporary(name: 'a'), temporary(
		name: 'b'
	)})
	func.add_instr(Ret{temporary(name: 'c')})

	le_module.add_function(func)
}

fn generate_main_func(mut le_module Module) {
	mut func := Function.new(Linkage.public(), 'main', [], Type.word)

	func.add_block('start')
	func.assign_instr(temporary(name: 'r'), Type.word, Call{'add', [
		Param{Type.word, constant(val: 1)},
		Param{Type.word, constant(val: 1)},
	]})

	func.add_instr(Call{'printf', [
		Param{Type.long, global(name: 'fmt')},
		Param{Type.variadic, none},
		Param{Type.word, temporary(name: 'r')},
	]})
	func.add_instr(Ret{constant(val: 0)})

	le_module.add_function(func)
}

fn generate_data(mut le_module Module) {
	items := [
		DataDefItem{Type.byte, dstr(string: 'One and one make %d!\\n')},
		DataDefItem{Type.byte, dconst(val: 0)},
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
