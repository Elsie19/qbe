import qbe.low { Value, Temporary }

fn main() {
	foo := Value(Temporary{"borg"})

	println(foo)
}
