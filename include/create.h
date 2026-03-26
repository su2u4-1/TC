#ifndef CREATE_H
#define CREATE_H

#include "parser.h"

// create struct functions
CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content);
Code* create_code(list(CodeMember*) members, SymbolTable* global_scope);
Import* create_import(Symbol* name, string source);
Function* create_function(Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* function_scope);
Method* create_method(Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* method_scope);
ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content);
Class* create_class(Symbol* name, list(ClassMember*) members, SymbolTable* class_scope, size_t size);
Variable* create_variable(Symbol* type, Symbol* name, Expression* value);
Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt);
If* create_if(Expression* condition, list(Statement*) body, list(ElseIf*) else_if, list(Statement*) else_body);
ElseIf* create_else_if(Expression* condition, list(Statement*) body);
For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body);
While* create_while(Expression* condition, list(Statement*) body);
Expression* create_expression(OperatorType operator, Expression * expr_left, Primary* prim_left, Expression* right);
Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value);
VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, list(Expression*) args_content);

#endif  // CREATE_H
