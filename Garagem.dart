import 'dart:io';

// Classe pai: reúne os dados comuns a todos os veículos.
class Veiculo {
  String modelo;
  String tipo;
  String cor;
  String placa;

  // Construtor da classe Veiculo.
  Veiculo(this.modelo, this.tipo, this.cor, this.placa);

  // Dois veículos serão iguais quando todos os seus dados forem iguais.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Veiculo) return false;

    return modelo == other.modelo &&
        tipo == other.tipo &&
        cor == other.cor &&
        placa == other.placa;
  }

  // Deve ser redefinido junto com o operador ==.
  @override
  int get hashCode => Object.hash(modelo, tipo, cor, placa);
}

// extends faz Carro herdar os campos e métodos de Veiculo.
class Carro extends Veiculo {
  // super envia os argumentos para o construtor da classe pai.
  Carro(String modelo, String tipo, String cor, String placa)
    : super(modelo, tipo, cor, placa);
}

// Moto também é uma classe filha de Veiculo.
class Moto extends Veiculo {
  Moto(String modelo, String tipo, String cor, String placa)
    : super(modelo, tipo, cor, placa);
}

// Caminhao é outra classe filha de Veiculo.
class Caminhao extends Veiculo {
  Caminhao(String modelo, String tipo, String cor, String placa)
    : super(modelo, tipo, cor, placa);
}

// A garagem é responsável por guardar e administrar os veículos.
class Garagem {
  // final impede trocar a lista, mas permite adicionar e remover itens.
  final List<Veiculo> veiculos = [];

  void adicionar(Veiculo veiculo) {
    veiculos.add(veiculo);
  }

  void listar() {
    if (veiculos.isEmpty) {
      print('Não há veículos cadastrados.');
      return;
    }

    for (final veiculo in veiculos) {
      print(
        '${veiculo.tipo}: ${veiculo.modelo}, ${veiculo.cor}, placa ${veiculo.placa}',
      );
    }
  }

  void removerPorPlaca(String placa) {
    // removeWhere remove os veículos que atendem à condição.
    final quantidadeAntes = veiculos.length;
    veiculos.removeWhere((veiculo) => veiculo.placa == placa);

    if (veiculos.length < quantidadeAntes) {
      print('Veículo removido com sucesso.');
    } else {
      print('Veículo não encontrado.');
    }
  }
}

void main() {
  // A garagem é criada uma única vez e permanece durante o programa.
  final garagem = Garagem();
  var continuar = true;

  while (continuar) {
    print('\n=== SISTEMA DE CONTROLE DE GARAGEM ===');
    print('1. Adicionar veículo');
    print('2. Remover veículo');
    print('3. Listar veículos');
    print('4. Sair');
    stdout.write('Opção: ');
    final opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        stdout.write('Modelo: ');
        final modelo = stdin.readLineSync() ?? '';
        stdout.write('Tipo (Carro, Moto ou Caminhao): ');
        final tipo = stdin.readLineSync() ?? '';
        stdout.write('Cor: ');
        final cor = stdin.readLineSync() ?? '';
        stdout.write('Placa: ');
        final placa = stdin.readLineSync() ?? '';

        // Objetos filhos podem ser armazenados em uma lista de Veiculo.
        if (tipo == 'Carro') {
          garagem.adicionar(Carro(modelo, tipo, cor, placa));
        } else if (tipo == 'Moto') {
          garagem.adicionar(Moto(modelo, tipo, cor, placa));
        } else if (tipo == 'Caminhao') {
          garagem.adicionar(Caminhao(modelo, tipo, cor, placa));
        } else {
          print('Tipo inválido.');
          continue;
        }

        print('Veículo adicionado com sucesso.');
        break;

      case '2':
        stdout.write('Placa do veículo a remover: ');
        final placa = stdin.readLineSync() ?? '';
        garagem.removerPorPlaca(placa);
        break;

      case '3':
        garagem.listar();
        break;

      case '4':
        continuar = false;
        print('Saindo do sistema...');
        break;

      default:
        print('Opção inválida.');
    }
  }
}
