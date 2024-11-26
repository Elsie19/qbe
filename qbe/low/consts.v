module low

// Wrapper for constants and variables.
pub type Value = Temporary | Global | Const

// Temporary variable type.
pub struct Temporary {
pub:
	// The variable name
	v string @[required]
	// Thread-local storage
	t bool
}

// Global variable type.
pub struct Global {
pub:
	// The variable name
	v string @[required]
	// Thread-local storage
	t bool
}

// Const variable type.
pub struct Const {
pub:
	// The constant value
	v u64 @[required]
	// Thread-local storage
	t bool
}

// Print `Value` as a QBE IR variable. This should correspond roughly with
// <https://c9x.me/compile/doc/il.html#Constants-and-Vals>.
//
// ### Example input->output
//
// |    Input           | Output |
// |:------------------:|:------:|
// | `Temporary{"foo"}` | `%foo` |
// | `Global{"foo"}`    | `$foo` |
// | `Const{64}`        | `64`   |
pub fn (v Value) str() string {
	return match v {
		Temporary { v.str() }
		Global { v.str() }
		Const { v.str() }
	}
}

pub fn (t Temporary) str() string {
	return if t.t {
		'thread %${t.v}'
	} else {
		'%${t.v}'
	}
}

pub fn (g Global) str() string {
	return if g.t {
		'thread \$${g.v}'
	} else {
		'\$${g.v}'
	}
}

pub fn (c Const) str() string {
	return if c.t {
		'thread ${c.v}'
	} else {
		'${c.v}'
	}
}

@[params]
pub struct GlobalTempConfig {
pub:
	// Variable name
	name string
	// Threaded status
	thread bool
}

@[params]
pub struct ConstConfig {
pub:
	// Constant value
	val u64
	// Threaded status
	thread bool
}

pub fn temporary(tmp GlobalTempConfig) Value {
	return Value(Temporary{
		v: tmp.name
		t: tmp.thread
	})
}

pub fn global(tmp GlobalTempConfig) Value {
	return Value(Global{
		v: tmp.name
		t: tmp.thread
	})
}

pub fn constant(tmp ConstConfig) Value {
	return Value(Const{
		v: tmp.val
		t: tmp.thread
	})
}
