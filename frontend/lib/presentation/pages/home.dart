import 'package:flutter/material.dart';
import 'package:frontend/presentation/pages/notation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController session_number_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('French Program Elector'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextField(
                controller: session_number_controller,
                decoration: const InputDecoration(
                  labelText: 'Session Number',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notation(
                        sessionNumber: session_number_controller.text,
                      ),
                    ),
                  );
                },
                child: const Text('Continue Session'),
              )
            ],
          ),
          ElevatedButton(
            child: const Text("New Session"),
            onPressed: () {
              /**
               * TODO: get generated session number from server
               * TODO: navigate to notation page
               */
            },
          ),
        ],
      ),
    );
  }
}
