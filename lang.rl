%%{
  machine lang;

  integer_value = digit+ > begin_token % INTEGER;

  ws = [ \t]*;

  op_plus = "+" % OP_PLUS;
  op_minus = "-" % OP_MINUS;
  op_mul = "*" % OP_TIMES;
  op_div = "/" % OP_DIVIDE;

  operators = op_plus | op_minus | op_mul | op_div;

  expr = integer_value ws operators ws integer_value;


  main := expr % done ;

}%%


