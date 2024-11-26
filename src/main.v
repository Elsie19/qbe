import qbe { Value, Temporary }

fn main() {
	foo := Value(Temporary{"bar"})

	println(foo)
}
