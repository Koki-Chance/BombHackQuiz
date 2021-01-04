// BombHackQuiz

import 'package:flutter/material.dart'; 

void main() => runApp(MyApp()); 

// The Bomb Unlock Success Page
class BombUnlocked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.green[500],
      title: Text("Félicitation !!"),
      ),
      body: Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 25),
          Text(
            'La bombe est désactivée.',
            style: TextStyle(
              
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(
                    'https://i.pinimg.com/736x/e1/1d/33/e11d33eba413c3a5758ea3b2c639ad1f.jpg',
             width: 500,
             height: 400,
           ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green[500],
            ),
            onPressed: () {
              Navigator.pop(context); // Navigate back to first route when tapped.
            },
            child: Text('Revenir à Bomb Hacking Outil'),
          ), // ElevatedButton
          
        ], // children: <Widget>
      ), // Column
      ), // Center
    );
  }
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Bomb Hacking Outil'; 

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Color(0xFFFF1744),
        ),
        body: MyCustomForm(),
      ),
    );
  }
} 

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
} 

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  
  final _formController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25),
          Center(
//             height: 250,
//             width: 250,
            child: Image.network(
              'https://static.vecteezy.com/system/resources/previews/000/468/530/original/vector-bomb-realistic-illustration.jpg',
              width: 300,
              height: 300,
            ),
          ),
          
          SizedBox(height: 25),
          
          Text('Indice : Quand Christophe Colomb arrive-t-il en Amérique ?'),
          
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Mot de passe',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Veuillez entrer un mot de passe'; 
              } else if (value != "1492") {
                return 'Mot de passe invalide';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: 
            
            Center(
            
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFF1744),
              ),
              
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  _formController.clear();
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BombUnlocked()),
                  );
                }
              },
              child: Text('Arrêt de la bombe'), 
            ),
            
            ), // Center
            
            
          ),
        ],
      ),
    );
  }
}
