indirect enum ArithExpr {
	case num(Float)
	case add(ArithExpr, ArithExpr)
	case sub(ArithExpr, ArithExpr)
	case mul(ArithExpr, ArithExpr)
	case div(ArithExpr, ArithExpr)
}

indirect enum BoolExpr {
    case bool(Bool)
    case and(BoolExpr, BoolExpr)
    case or(BoolExpr, BoolExpr)
    case xor(BoolExpr, BoolExpr)
    case not(BoolExpr)
    case eq(ArithExpr, ArithExpr)
    case neq(ArithExpr, ArithExpr)
    case lt(ArithExpr, ArithExpr)
    case gt(ArithExpr, ArithExpr)
    case leq(ArithExpr, ArithExpr)
    case geq(ArithExpr, ArithExpr)
}

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

func boolEval(_ expr: BoolExpr) -> Bool {
    switch expr {
        case .bool(let x):
            return x
        case .and(let l, let r):
            return boolEval(l) && boolEval(r)
        case .or(let l, let r):
            return boolEval(l) || boolEval(r)
        case .xor(let l, let r):
            return (boolEval(l) && !boolEval(r)) || (!boolEval(l) && boolEval(r))
        case .not(let x):
            return !boolEval(x)
        case .eq(let l, let r): 
            return arithEval(l) == arithEval(r)
        case .neq(let l, let r): 
            return arithEval(l) != arithEval(r)
        case .lt(let l, let r): 
            return arithEval(l) < arithEval(r)
        case .gt(let l, let r): 
            return arithEval(l) > arithEval(r)
        case .leq(let l, let r): 
            return arithEval(l) >= arithEval(r)
        case .geq(let l, let r): 
            return arithEval(l) <= arithEval(r)
    }
}

let x: ArithExpr = .add(.mul(.num(5.0), .num(1.0)), .num(60.6))

let y: BoolExpr = .and(.bool(true), .xor(.bool(false),.bool(false)))

print(arithEval(x))

print(boolEval(y))