indirect enum ArithExpr {
	case num(Float)
	case add(ArithExpr, ArithExpr)
	case sub(ArithExpr, ArithExpr)
	case mul(ArithExpr, ArithExpr)
	case div(ArithExpr, ArithExpr)
}

indirect enum BoolExpr {
    case bool(Bool)
    case and(Bool, Bool)
    case or(Bool, Bool)
    case xor(Bool, Bool)
    case not(Bool)
}

let x: ArithExpr = .add(.mul(.num(5.0), .num(1.0)), .num(60.6))

func arithEval(_ expr: ArithExpr) -> Float {
	switch (expr) {
		case .num(let x):
			return x
		case .add(let l, let r):
			return arithEval(l) + arithEval(r)
		case .sub(let l, let r):
			return arithEval(l) - arithEval(r)
		case .mul(let l, let r):
			return arithEval(l) * arithEval(r)
		case .div(let l, let r):
			return arithEval(l) / arithEval(r)
	}
}

print(arithEval(x))