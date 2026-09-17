import 'dart:io';
import 'dart:math';

class Cliente {
  final String nome;
  Cliente(this.nome);
}

class ContaBancaria {
  final String numero;
  final Cliente titular;
  double _saldo = 0.0;

  ContaBancaria(this.numero, this.titular);

  double get saldo => _saldo;

  void depositar(double valor) {
    if (valor > 0) {
      _saldo += valor;
      print('R\$ ${valor.toStringAsFixed(2)} depositado com sucesso!');
    }
  }

  void sacar(double valor) {
    if (valor > 0 && valor <= _saldo) {
      _saldo -= valor;
      print(' R\$ ${valor.toStringAsFixed(2)} sacado com sucesso!');
    } else {
      print('Erro: Saldo insuficiente ou valor inválido!');
    }
  }
}

class Banco {
  final String nomeBanco;
  final List<ContaBancaria> _contas = [];

  Banco(this.nomeBanco);

  ContaBancaria abrirConta(Cliente cliente) {
    String numeroGerado = (Random().nextInt(9000) + 1000).toString();
    ContaBancaria novaConta = ContaBancaria(numeroGerado, cliente);
    _contas.add(novaConta);
    return novaConta;
  }
}

void main() {
  print('=== BEM-VINDO AO CONFIGURADOR DE BANCO ===');
  
  // 1. Definindo o nome do Banco
  stdout.write('Digite o nome do seu Banco: ');
  String nomeDoBanco = stdin.readLineSync() ?? 'Banco Padrão';
  Banco meuBanco = Banco(nomeDoBanco);
  
  print('\n--- Criando sua Conta no $nomeDoBanco ---');
  
  // 2. Definindo o nome do Cliente
  stdout.write('Digite o seu nome completo: ');
  String nomeDoCliente = stdin.readLineSync() ?? 'Usuário Anônimo';
  
  Cliente cliente = Cliente(nomeDoCliente);
  ContaBancaria minhaConta = meuBanco.abrirConta(cliente);
  
  print('\n✅ Conta criada com sucesso!');
  print('Titular: ${minhaConta.titular.nome}');
  print('Número da Conta: ${minhaConta.numero}');
  print('Saldo Inicial: R\$ ${minhaConta.saldo.toStringAsFixed(2)}');

  print('\n--- Testando o Depósito ---');
  stdout.write('Quanto você deseja DEPOSITAR? R\$ ');
  // Lendo o texto e convertendo para número decimal (double)
  String entradaDeposito = stdin.readLineSync() ?? '0';
  double valorDeposito = double.tryParse(entradaDeposito) ?? 0.0;
  minhaConta.depositar(valorDeposito);
  print('Saldo atual: R\$ ${minhaConta.saldo.toStringAsFixed(2)}');

  print('\n--- Testando o Saque ---');
  stdout.write('Quanto você deseja SACAR? R\$ ');
  String entradaSaque = stdin.readLineSync() ?? '0';
  double valorSaque = double.tryParse(entradaSaque) ?? 0.0;
  minhaConta.sacar(valorSaque);
  
  print('\n=== Operações finalizadas no $nomeDoBanco ===');
  print('Saldo final de ${minhaConta.titular.nome}: R\$ ${minhaConta.saldo.toStringAsFixed(2)}');
}
