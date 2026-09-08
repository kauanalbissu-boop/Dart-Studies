//Calculo media dos alunos


import 'dart:io';

class Rank {
  String? nome;
  double? nota;
  Rank(this.nome, this.nota);
}

void main(){
  List<Rank> listaRank = [];

  stdout.write('Quantos alunos existem na sala?');
  String? alunos = stdin.readLineSync();
  int aluno = int.parse(alunos!);

  stdout.write('Quantos matérias são?');
  String? materias = stdin.readLineSync();
  int materia = int.parse(materias!);

  for (int i = 0; i < aluno; i++) {
    stdout.write('\n Qual o nome do aluno ${i + 1}?');
    String? nomeAluno = stdin.readLineSync();

    List<double> notasAlunoAtual = [];

  for (int j = 0; j < materia; j++){
    stdout.write('Digite a nota da ${j + 1}º matéria');
    String? notas = stdin.readLineSync();
    double nota = double.parse(notas!);

    notasAlunoAtual.add(nota);
}

double somaDasNotas = notasAlunoAtual.reduce((a, b) => a + b);

double mediaFinal = somaDasNotas / materia;

Rank novoRank = Rank(nomeAluno, mediaFinal);
listaRank.add(novoRank);


print('\n-----BOLETIM DA SALA-----\n');
for(var alunoEmDestaque in listaRank){
  print('Nome: ${alunoEmDestaque.nome} Média: ${alunoEmDestaque.nota?.toStringAsFixed(1)}');
}
}
}