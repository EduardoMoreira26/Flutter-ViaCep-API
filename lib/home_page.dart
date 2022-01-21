import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

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
                    // searchCep(textController.text);
                  },
                  child: Text('Pesquisar')),
            ),
            SizedBox(height: 20),
               SizedBox(height: 20),
              //  if (isLoading) Expanded(child: Center(child: CircularProgressIndicator())),
              //   if (error != null) Text(error, style: TextStyle(color: Colors.black),),
              //   if (!isLoading && cepResult.isNotEmpty) Text("Cidade: ${cepResult['localidade']}"),
          ],
        ),
      ),
    );
  }
}
