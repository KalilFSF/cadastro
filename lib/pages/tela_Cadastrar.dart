import 'package:flutter/material.dart';
import 'package:revisao/pages/tela_Logar.dart';
import 'package:revisao/pages/tela_Revisao.dart';

class TelaCadastrar extends StatefulWidget {
  const TelaCadastrar({super.key});

  @override
  State<TelaCadastrar> createState() => _TelaCadastrarState();
}

class _TelaCadastrarState extends State<TelaCadastrar> {
  final TextEditingController emailController =
      TextEditingController(); //Controlar o campo de email
  final TextEditingController senhaController =
      TextEditingController(); //Controlar o campo de senha
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  String mensagemErro =
      ''; //Guarda a mensagem de erri que pode aparecer na tela

  bool emailValido(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return regex.hasMatch(email);
  }

  bool _obscureSenha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                size: 95,
                color: Colors.deepOrange,
              ),
              const SizedBox(height: 10),
              const Text(
                'Tela de Cadastro',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Digite seu email e senha para acessar o app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                //Campo para o usuario
                controller: emailController, //liga campo com controlador
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email', //TEXTO principal do campo
                  hintText: 'Digite seu email', //Dica dentro do campo
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: senhaController,
                obscureText:
                    _obscureSenha, // Usa a variável para controlar a visibilidade
                decoration: InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: confirmarSenhaController,
                obscureText:
                    _obscureSenha, // Usa a variável para controlar a visibilidade
                decoration: InputDecoration(
                  labelText: 'Confirme Senha',
                  hintText: 'Digite sua senha novamente',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                mensagemErro, //String que declaramos na linha 16
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: () {
                    String email = emailController.text; //pega o email digitado
                    String senha = senhaController.text; //pega a senha digitada
                    String nome = nomeController.text; //pega o nome digitado
                    String confirmarSenha = confirmarSenhaController
                        .text; //pega a confirmação de senha digitada

                    if (nome.isEmpty) {
                      // Se nome vazio, entra aqui
                      setState(() {
                        mensagemErro = 'Digite seu nome.';
                      });
                    } else if (email.isEmpty) {
                      // Se email vazio, entra aqui
                      setState(() {
                        mensagemErro = 'Digite um email.';
                      });
                    } else if (!emailValido(email)) {
                      // Se email sem @, entra aqui
                      setState(() {
                        mensagemErro = 'Digite um email válido.';
                      });
                    } else if (senha.isEmpty) {
                      // Se senha ou confirmação de senha vazia, entra aqui
                      setState(() {
                        mensagemErro = 'Digite uma senha.';
                      });
                    } else if (senha.length < 6) {
                      setState(() {
                        mensagemErro =
                            'A senha precisa ter pelo menos 6 caracteres';
                      });
                    } else if (confirmarSenha.isEmpty) {
                      setState(() {
                        mensagemErro = 'Confirme sua senha.';
                      });
                     }else if (senha != confirmarSenha) {
                      setState(() {
                        mensagemErro = 'As senhas não são iguais';
                      });
                    } else {
                      setState(() {
                        mensagemErro = 'Cadastro realizado com sucesso!';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaRevisao(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text('Cadastrar')),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context, //indica onde estamos no app
                    MaterialPageRoute(
                      // Cria rota para nova tela
                      builder: (context) => const TelaRevisao(),
                      //builder -- informa qual sera a tela aberta
                    ),
                  );
                },
                icon: const Icon(Icons.person_add,
                    color: Color.fromARGB(255, 55, 63, 70)),
                label: const Text(
                  'Não tem conta? Cadastre-se',
                  style: TextStyle(color: Color.fromARGB(255, 55, 63, 70)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
