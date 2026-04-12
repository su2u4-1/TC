#ifndef TAC_H
#define TAC_H

#include "object.h"

TAC* tac_code(Code* code);
void tac_import(Import* import, TAC* tac, TACStatus* status);
void tac_function(Function* function, TACStatus* status);
void tac_method(Method* method, TACStatus* status);
void tac_class(Class* class, TACStatus* status);
void tac_variable(Variable* variable, TACStatus* status, bool is_attr);
void tac_statement(Statement* statement, TACStatus* status);
void tac_if(If* if_, TACStatus* status);
void tac_for(For* for_, TACStatus* status);
void tac_while(While* while_, TACStatus* status);
Arg* tac_expression(Expression* expression, TACStatus* status);
Arg* tac_primary(Primary* primary, TACStatus* status);
Arg* tac_variable_access(VariableAccess* variable_access, TACStatus* status);

void output_TAC(TAC* tac, FILE* outfile, size_t indent);

#endif  // TAC_H
