import 'package:flutter/material.dart';
import '/data/user_data.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    userData.sort((a, b) => a['nome'].compareTo(b['nome']));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de usuários"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white70,
      body: Container(
        alignment: Alignment.topCenter,
        child: new ListView.builder(
          itemCount: userData.length,
          padding: const EdgeInsets.only(bottom: 15.0),
          itemBuilder: (BuildContext context, int position) {
            return Column(
              children: <Widget>[
                Divider(height:5.5),
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(userData[position]['nome']),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email: ${userData[position]['email']}"),
                              Text("Telefone: ${userData[position]['telefone']}"),
                              Text("Endereço: ${userData[position]['endereco']['rua']}, "
                                  "${userData[position]['endereco']['bairro']}, "
                                  "${userData[position]['endereco']['cidade']}, "
                                  "${userData[position]['endereco']['uf']}"),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Fechar"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget> [
                    new Text(
                        "${userData[position]['nome']}"
                    )
                  ]),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text ("Email: ${userData[position]['email']}"),
                      Text ("Cidade: ${userData[position]['endereco']['cidade']}"),
                      Text ("UF: ${userData[position]['endereco']['uf']}")
                    ],
                  ),
                )
              ],
            );
          },
        )
      )
    );
  }
}