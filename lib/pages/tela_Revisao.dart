import 'package:flutter/material.dart';
import 'package:revisao/pages/tela_Cadastrar.dart';

class TelaRevisao extends StatefulWidget {
  //muda de estado
  const TelaRevisao({super.key});

  @override
  State<TelaRevisao> createState() => _TelaRevisaoState();
  //Onde fica os dados que podem mudar
}

class _TelaRevisaoState extends State<TelaRevisao> {
  //classe que vai mudar de estado
  String mensagem = 'Clique em uma opcao';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //retorno da aplicacao
      appBar: AppBar(
        //cabeçalho
        title: const Text('Revisao Flutter'),
      ),

      body: SafeArea(
        //Protege o conteudo das areas
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            //Organiza os widgets
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                //utiliza icones da biblioteca google
                Icons.lock_open,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 10),
              //espaco entre componetes
              const Text(
                'Vamos revisa wdgets, layout, estilo, botoes, estado e navegacao',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              

              Container(
                //funciona como uma caixa(div)
                width: 320,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16)),
                child: const Text(
                  'O container funciona como uma caixa ou div pode ter largura, padding, margin',
                  textAlign: TextAlign.center,
                ),
              ),
              Text(mensagem,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,),
              Row(
                //organiza os componetes de uma linha
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mensagem = 'Voce clicou no botao Azul';
                      });
                    },
                    child: const Text('Azul'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      elevation: 4,
                    ),
                    onPressed: () {
                      setState(() {
                        mensagem = 'Voce clicou no botao Destaque';
                      });
                    },
                    child: const Text('Destaque'),
                  )
                ],
              ),

              const SizedBox(height:  20),

              ElevatedButton.icon(
                onPressed: (){
                  Navigator.push(
                    context,//indica onde estamos no app
                    MaterialPageRoute(// Cria rota para nova tela
                      builder: (context) => const TelaCadastrar(),
                      //builder -- informa qual sera a tela aberta
                  ),
                );
              }, 
              label: const Text('Ir para detalhes'),
              icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        //Botão Flutuante
        onPressed: () {
          //a funcao que o botao faz
          setState(() {
            mensagem = 'Voce clicou no botao flutuante';
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}