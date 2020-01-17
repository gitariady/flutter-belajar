import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController namaController = new TextEditingController();
  TextEditingController npmController = new TextEditingController();
  TextEditingController makulController = new TextEditingController();
  TextEditingController sksController = new TextEditingController();
  TextEditingController nilaiController = new TextEditingController();


void addData() {
  var url = "https://teskoneksisaja.000webhostapp.com/flutter1/tambahPegawai.php";
  http.post(url, body: {
      "nama": namaController.text,
      "npm": npmController.text,
      "makul": makulController.text,
      "sks": sksController.text,
      "nilai": nilaiController.text
  });
}


  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Tambah Data Mahasiswa"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: <Widget>[
          new Column(
            children: <Widget>[
              new Padding(padding: new EdgeInsets.only(
                top: 15.0
              )),
              new TextField(
                controller: namaController,
                decoration: new InputDecoration(
                  hintText: "Input Nama Mahasiswa",
                  labelText: "Nama Mahasiswa",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0)
                  )
                )
              ),

              new Padding(padding: new EdgeInsets.all(5.0)),
              new TextField(
                controller: npmController,
                decoration: new InputDecoration(
                  hintText: "Input NPM",
                  labelText: "Npm",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0)
                  )
                )
              ),

              new Padding(padding: new EdgeInsets.all(5.0)),
              new TextField(
                controller: makulController,
                decoration: new InputDecoration(
                  hintText: "Input Mata Kuliah",
                  labelText: "Mata Kuliah",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0)
                  )
                )
              ),

              new Padding(padding: new EdgeInsets.all(5.0)),
              new TextField(
                controller: sksController,
                decoration: new InputDecoration(
                  hintText: "Input SKS",
                  labelText: "Jumlah Sks",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0)
                  )
                )
              ),

              new Padding(padding: new EdgeInsets.all(5.0)),
              new TextField(
                controller: nilaiController,
                decoration: new InputDecoration(
                  hintText: "Input Nilai",
                  labelText: "Nilai",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0)
                  )
                )
              ),

              new Padding(padding: new EdgeInsets.all(5.0)),
              new RaisedButton(
                child: new Text("Tambah Data"),
                color: Colors.green,
                onPressed: (){
                  //addData();
                  //untuk upload image
                  addData();
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Login()
                  ));
                },
              )
              
            ],
          )
        ],),
      ),
      );
  }
}