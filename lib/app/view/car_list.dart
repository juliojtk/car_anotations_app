import 'package:flutter/material.dart';

class CarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Veiículos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: (){
              
            },
          ),
        ],
      ),
    );
  }
}