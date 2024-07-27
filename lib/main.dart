import 'package:examen2/providers/peticion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 String texto = '';
 String temporal = '';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Examen Gerson Murillo'),
        ),
        body:  Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Container(
                
                margin: const EdgeInsets.all(10),
                child:  Container(
                  width: 1000,
                  height: 100,
                  child:  Text(texto, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                ),
              ),
               SafeArea(
                child:  TextField(

                    onChanged: (value) => {
                      setState(() {
                        temporal = value;
                      })
                    },
                    
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    
                    suffixIcon: IconButton(onPressed: () => 
                    {
                      if(temporal.contains('?')){
                        setState(() {
                          texto = temporal;
                          temporal = '';
                          
                        }),
                         FutureBuilder(
                          future: Peticion().getProductos(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if(snapshot.hasData){
                              final data = snapshot.data!;




                              return Image.network(data.toString());
                            }else{
                              return const CircularProgressIndicator();
                            }
                          },
                          
                         )
                      }
                    
                    }, icon: const Icon(Icons.person)),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}