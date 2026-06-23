import 'package:flutter/material.dart';
import 'package:revisao/pages/tela_Revisao.dart';
import 'package:revisao/pages/tela_Cadastrar.dart';

class TelaLogar extends StatefulWidget {
  const TelaLogar({super.key});

  @override
  State<TelaLogar> createState() => _TelaLogarState();
}

class _TelaLogarState extends State<TelaLogar> {
  final TextEditingController emailController =
      TextEditingController(); //Controlar o campo de email
  final TextEditingController senhaController =
      TextEditingController(); //Controlar o campo de senha

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
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 95,
                color: Color.fromARGB(255, 33, 105, 163),
              ),
              const SizedBox(height: 10),
              const Text(
                'Tela de Login',
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
                  suffixIcon: IconButton(
                    //Cria um icone no fim da caixa de texto
                    icon: Icon(
                      _obscureSenha ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      // Atualiza a tela mudando o estado da variável
                      setState(() {
                        _obscureSenha = !_obscureSenha;
                      });
                    },
                  ),
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

                    if (email.isEmpty) {
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
                      // Se senha vazia, entra aqui
                      setState(() {
                        mensagemErro = 'Digite uma senha.';
                      });
                    } else {
                      setState(() {
                        mensagemErro = '';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaRevisao(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Entrar')
              ),

              const SizedBox(height: 10),
              
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context, //indica onde estamos no app
                    MaterialPageRoute(
                      // Cria rota para nova tela
                      builder: (context) => const TelaCadastrar(),
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
