import 'dart:io';
import 'package:expressions/expressions.dart';


void main(List<String> arguments) {
  // dart vai ler a expressão
  print('Digite uma expressão matemática: ');
  String? expressao = stdin.readLineSync();
  
  // verifica se o usuário escreveu algo
  if(expressao != null && expressao.isNotEmpty) {
    try {
    // faz o parse da expressão  
    Expression expression = Expression.parse(expressao);

    // aqui cria um avaliador
    final evaluator = const ExpressionEvaluator();
    
    // aqui cria o contexto
    var context = <String, dynamic>{};

    // aqui cria uma variável cujo valor é o resultado da expressão digitada
    var resultado = evaluator.eval(expression, context);

    print('Resposta = $resultado');

    } catch (e) {
      print('Erro ao tentar resolver a expressão: $e');
    }

  } else {
    print('Você não inseriu uma expressão válida!');
  }

}