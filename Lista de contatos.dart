import 'dart:io';


class ListaContatos {
String? nome;
String? telefone;
ListaContatos(this.nome, this.telefone);
}


void main(){
bool continuar = true;
List<ListaContatos> contatos = []; 

while(continuar){

  print('\n==========ADICIONE SEU CONTATO==========\n');
  
  stdout.write('Adicione o  nome do seu contato: ');
  String? nomeContato = stdin.readLineSync();


  stdout.write('\nAdicione o número de telefone do seu contato: ');
  String? numeroContato = stdin.readLineSync();
  int? telefoneContato = int.tryParse(numeroContato!);

if (telefoneContato != null && telefoneContato.bitLength == 11) {
  String ddd = numeroContato.substring(0, 2);
  String numeroPrimeiraParte = numeroContato.substring(2, 7);
  String numeroSegundaParte = numeroContato.substring(7);

  String telefoneFormatado = "($ddd) $numeroPrimeiraParte-$numeroSegundaParte";

  contatos.add (ListaContatos(nomeContato, telefoneFormatado));
  print('Contato adicionado com sucesso! Nome: $nomeContato Telefone: $telefoneFormatado'); 

}

else{
    print('Algo deu errado revise as informações');
}


bool menu = true;
while(menu){
  

  print('\n==========SELECIONE UMA DAS OPÇÕES==========\n');
  print('1 -- Realizar outro cadastro');
  print('2 -- Verificar cadastros existentes');
  print('3 -- Excluir cadastro existente');
  stdout.write('4 -- Encerrar programa');
  String? escolha = stdin.readLineSync();

if (escolha == '1'){
  menu = false;
}

if (escolha == '2'){
  if(contatos.isEmpty){
    print('Nenhum cadastro cadastrado');
  }
  else{
    for(int i = 0; i < contatos.length; i++){
    print('Nome:${contatos[i].nome} Telefone ${contatos[i].telefone}');
}
}
}

if (escolha == '3'){
  print('==========EXCLUIR CONTATO==========');
  if (contatos.isEmpty){
    print('Nenhum cadastro feito par excluir');
  }
  else{
    for(int i = 0; i < contatos.length; i++){
    print(' [$i] Nome:${contatos[i].nome} Telefone ${contatos[i].telefone}');
}

stdout.write('Digite o número do contato para excluir:');
String? entradaNumeroExcluir = stdin.readLineSync();
int numeroExcluir = int.parse(entradaNumeroExcluir  ?? '');

if (numeroExcluir != 0 && numeroExcluir >= 0 && numeroExcluir < contatos.length){
String? nomeRemovido = contatos[numeroExcluir].nome;
contatos.removeAt(numeroExcluir);
print('$nomeRemovido foi excluido da lista de contatos');
}
else{
  print('O contato selecionado não é válido');
}
}
}
if(escolha == '4'){
menu = false;
continuar = false;

print('O programa foi encerrado');
}
}
}
}