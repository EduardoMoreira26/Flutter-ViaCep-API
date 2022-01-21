import 'package:flutter/material.dart';
import 'package:viacep/home/search_cep_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  final searchCepBloc = SearchCepBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Home'),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'cep'),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  searchCepBloc.searchCep.add(textController.text);
                },
                child: Text('Pesquisar'),
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<Map>(
              stream: searchCepBloc.cepResult,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: TextStyle(color: Colors.red),
                  );
                }

                if (!snapshot.hasData) {
                  return Container();
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return Text(
                    "Endereço: ${snapshot?.data['logradouro']} - ${snapshot?.data['bairro']} - ${snapshot?.data['localidade']} - ${snapshot?.data['uf']}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
