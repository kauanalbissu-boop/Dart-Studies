import 'dart:io';
import 'dart:math';

class Quiz {
  String? pergunta;
  List<String>? alternativa;
  String? respostaCorreta;

  Quiz(this.pergunta, this.alternativa, this.respostaCorreta);
}

void main() {

  final random = Random();
  
    List<Quiz> perguntasRespostas = [
      //Estrutura básica Nome da class ordem definida pelo this, pergunta, alternativa e depois a resposta
      Quiz('Qual é o país com a maior extensão territorial do mundo?', ['A) Canadá', 'B) China', 'C) Rússia', 'D) Estados Unidos'], 'C'),
      Quiz('Qual é a capital da Austrália?', ['A) Sydney', 'B) Melbourne', 'C) Camberra', 'D) Brisbane'], 'C'),
      Quiz('Em qual continente fica localizado o Egito?', ['A) Ásia', 'B) África', 'C) Europa', 'D) América'], 'B'),
      Quiz('Qual é a maior cordilheira do mundo em extensão terrestre?', ['A) Himalaia', 'B) Alpes', 'C) Montanhas Rochosas', 'D) Cordilheira dos Andes'], 'D'),
      Quiz('Qual é o menor país do mundo?', ['A) Mônaco', 'B) Vaticano', 'C) Nauru', 'D) Liechtenstein'], 'B'),
      Quiz('Qual é o oceano mais profundo do planeta?', ['A) Oceano Atlântico', 'B) Oceano Índico', 'C) Oceano Pacífico', 'D) Oceano Ártico'], 'C'),
      Quiz('Qual é o maior deserto quente do mundo?', ['A) Deserto de Atacama', 'B) Deserto do Saara', 'C) Deserto de Gobi', 'D) Deserto de Kalahari'], 'B'),
      Quiz('Qual país possui o maior número de ilhas no mundo?', ['A) Indonésia', 'B) Filipinas', 'C) Suécia', 'D) Japão'], 'C'),
      Quiz('Em qual país fica localizado o Monte Everest?', ['A) Índia', 'B) Nepal', 'C) China', 'D) Paquistão'], 'B'),
      Quiz('Qual é o ponto mais alto do relevo brasileiro?', ['A) Pico da Neblina', 'B) Pico das Agulhas Negras', 'C) Pico da Bandeira', 'D) Monte Roraima'], 'A'),
      Quiz('Qual destes países NÃO faz fronteira com o Brasil?', ['A) Bolívia', 'B) Colômbia', 'C) Chile', 'D) Suriname'], 'C'),
      Quiz('Qual é a capital do Canadá?', ['A) Toronto', 'B) Vancouver', 'C) Montreal', 'D) Ottawa'], 'D'),
      Quiz('Qual é a maior ilha do mundo?', ['A) Madagascar', 'B) Groenlândia', 'C) Nova Guiné', 'D) Bornéu'], 'B'),
      Quiz('Qual estreito separa a Ásia da América do Norte?', ['A) Estreito de Gibraltar', 'B) Estreito de Bering', 'C) Estreito de Magalhães', 'D) Estreito de Bósforo'], 'B'),
      Quiz('Qual é o estado mais extenso do Brasil?', ['A) Mato Grosso', 'B) Pará', 'C) Amazonas', 'D) Bahia'], 'C'),
      ];

  bool tentativas = true;
  int tentativa = 1;

  while(tentativas){

  int pontuacaoAcertos = 0;
  int pontuacaoErros = 0;

List<Quiz> perguntaTentativa = List.from(perguntasRespostas);

while (perguntaTentativa.isNotEmpty){

int perguntaAleatoria = random.nextInt(perguntaTentativa.length);
Quiz perguntaAtual = perguntaTentativa.removeAt(perguntaAleatoria);

print('${perguntaAtual.pergunta}');
for(var alt in perguntaAtual.alternativa!){
print(alt);
}

stdout.write('\nSua resposta (A - B - C - D)\n ');
String? resposta = stdin.readLineSync();
String respostaUsuario = (resposta ?? '').trim().toUpperCase();


if (respostaUsuario == perguntaAtual.respostaCorreta){
  print('\nParabens! resposta correta \n');
  pontuacaoAcertos++;

}
else {
  print('Resposta Errada');
  pontuacaoErros++;
}
}

print('\n========RODADA ENCERRADA========\n');
print('Você acertou $pontuacaoAcertos e errou $pontuacaoErros');
print('\n========RODADA ENCERRADA========\n');

stdout.write('Rodada encerrada, deseja jogar novamente (S/N)?');
String? respostaTentativa = stdin.readLineSync();

if ((respostaTentativa ?? '').trim().toUpperCase() != 'S'){
tentativas = false;
print('Jogo encerrado, obrigado por jogar');
}
else{
  tentativa++;
  print('\n Iniciando nova tentativa número $tentativa \n');

}

  


    }
  }