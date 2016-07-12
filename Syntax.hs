module Syntax where

type Name = String

data Expr
    = Float Double
    | BinOp Op Expr Expr
    | Var String
    | Call Name [Expr]
    | Function Name [Expr] Expr
    | Extern Name [Expr]
    deriving (Eq, Ord, Show)

data Op
    = Plus
    | Minux
    | Times
    | Devide
    deriving (Eq, Ord, Show)
