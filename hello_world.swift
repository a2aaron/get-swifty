indirect enum ArithExpr {
	case num(Float)
	case add(ArithExpr, ArithExpr)
	case sub(ArithExpr, ArithExpr)
	case mul(ArithExpr, ArithExpr)
	case div(ArithExpr, ArithExpr)
}

let x: ArithExpr = .add(.mul(.num(5.0), .num(1.0)), .num(60.6))