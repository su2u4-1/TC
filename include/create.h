#ifndef CREATE_H
#define CREATE_H

#include "lib.h"
#include "parser.h"

// create struct functions
// `CodeMember* create_code_member(CodeMemberType type, (Import* | Function* | Class*) content)`
offset(CodeMember*) create_code_member(CodeMemberType type, offset(Import* | Function * | Class*) content);
// `Code* create_code(list<CodeMember*>* members, Scope* global_scope)`
offset(Code*) create_code(list(CodeMember*) members, offset(Scope*) global_scope);
// `Import* create_import(Name* name, string source)`
offset(Import*) create_import(offset(Name*) name, string source);
// `Function* create_function(Name* name, Name* return_type, list<Variable*>* parameters, list<Statement*>* body, Scope* function_scope)`
offset(Function*) create_function(offset(Name*) name, offset(Name*) return_type, list(Variable*) parameters, list(Statement*) body, offset(Scope*) function_scope);
// `Method* create_method(Name* name, Name* return_type, list<Variable*>* parameters, list<Statement*>* body, Scope* method_scope)`
offset(Method*) create_method(offset(Name*) name, offset(Name*) return_type, list(Variable*) parameters, list(Statement*) body, offset(Scope*) method_scope);
// `ClassMember* create_class_member(ClassMemberType type, (Method* | Variable*) content)`
offset(ClassMember*) create_class_member(ClassMemberType type, offset(Method* | Variable*) content);
// `Class* create_class(Name* name, list<ClassMember*>* members, Scope* class_scope)`
offset(Class*) create_class(offset(Name*) name, list(ClassMember*) members, offset(Scope*) class_scope);
// `Variable* create_variable(Name* type, Name* name, Expression* value)`
offset(Variable*) create_variable(offset(Name*) type, offset(Name*) name, offset(Expression*) value);
// `Statement* create_statement(StatementType type, (If* | While* | For* | Expression* | Variable* | Expression* ) stmt)`
offset(Statement*) create_statement(StatementType type, offset(If* | While * | For * | Expression * | Variable*) stmt);
// `If* create_if(Expression* condition, list<Statement*>* body, list<ElseIf*>* else_if, list<Statement*>* else_body)`
offset(If*) create_if(offset(Expression*) condition, list(Statement*) body, list(ElseIf*) else_if, list(Statement*) else_body);
// `ElseIf* create_else_if(Expression* condition, list<Statement*>* body)`
offset(ElseIf*) create_else_if(offset(Expression*) condition, list(Statement*) body);
// `For* create_for(Variable* initializer, Expression* condition, Expression* increment, list<Statement*>* body)`
offset(For*) create_for(offset(Variable*) initializer, offset(Expression*) condition, offset(Expression*) increment, list(Statement*) body);
// `While* create_while(Expression* condition, list<Statement*>* body)`
offset(While*) create_while(offset(Expression*) condition, list(Statement*) body);
// `Expression* create_expression(OperatorType operator, (Expression* | Primary*) left, Expression* right)`
offset(Expression*) create_expression(OperatorType operator, offset(Expression* | Primary*) left, offset(Expression*) right);
// `Primary* create_primary(PrimaryType type, (string | Expression* | Primary* | VariableAccess*) value)`
offset(Primary*) create_primary(PrimaryType type, offset(string | Expression * | Primary * | VariableAccess*) value);
// `VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, (Name* | Expression*) content)`
offset(VariableAccess*) create_variable_access(VariableAccessType type, offset(VariableAccess*) base, offset(Name* | Expression * | list(Expression*)) content);

#endif  // CREATE_H
