module Parser where

import Text.Parsec
import Text.Parsec.String (Parser)

import qualified Text.Parsec.Expr  as Ex
import qualified Text.Parsec.Token as Tok

import Lexer
import Syntax

binary s f assoc = Ex.Infix (reservedOp s >> return (BinOp f)) assoc

table = [[ binary "*" Times  Ex.AssocLeft
         , binary "/" Devide Ex.AssocLeft]
        ,[ binary "+" Plus   Ex.AssocLeft
         , binary "-" Minux  Ex.AssocLeft]
        ]

int :: Parser Expr
int = do
         n <- integer
         return $ Float (fromInteger n)

floating :: Parser Expr
floating = do
        n <- float
        return $ Float n

expr :: Parser Expr
expr = Ex.buildExpressionParser table factor

variable :: Parser Expr
variable = do
        var <- identifier
        return $ Var var

function :: Parser Expr
function = do
        reserved "def"
        name <- identifier
        args <- parens $ many variable
        body <- expr
        return $ Function name args body

extern :: Parser Expr
extern = do
        reserved "extern"
        name <- identifier
        args <- parens $ commaSep expr
        return $ Extern name args

call :: Parser Expr
call = do
        name <- identifier
        args <- parens $ commaSep expr
        return $ Call name args


factor :: Parser Expr
factor = try floating
     <|> try int
     <|> try extern
     <|> try function
     <|> try call
     <|> variable
     <|> parens expr

defn :: Parser Expr
defn = try extern
   <|> try function
   <|> try expr

contents :: Parser a -> Parser a
contents p = do
    Tok.whiteSpace lexer
    r <- p
    eof
    return r

toplevel :: Parser [Expr]
toplevel = many $ do
    def <- defn
    reservedOp ";"
    return def

parseExpr :: String -> Either ParseError Expr
parseExpr s = parse (contents expr) "<stdin>" s

parseTopLevel :: String -> Either ParseError [Expr]
parseTopLevel s = parse (contents toplevel) "<stdin>" s
