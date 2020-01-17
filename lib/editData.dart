import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list, this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController namaController = new TextEditingController();
  TextEditingController npmController = new TextEditingController();
  TextEditingController makulController = new TextEditingController();
  TextEditingController sksController = new TextEditingController();
  TextEditingController nilaiController = new TextEditingController();
  void editData() {
    var url = "https://teskoneksisaja.000webhostapp.com/flutter1/editPegawai.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nama": namaController.text,
      "npm": npmController.text,
      "makul": makulController.text,
      "sks": sksController.text,
      "nilai": nilaiController.text
    });
  }

  @override
  void initState() {
    namaController =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    npmController =
        new TextEditingController(text: widget.list[widget.index]['npm']);
    makulController =
        new TextEditingController(text: widget.list[widget.index]['makul']);
    sksController =
        new TextEditingController(text: widget.list[widget.index]['sks']);
    nilaiController =
        new TextEditingController(text: widget.list[widget.index]['nilai']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Edit Data Mahasiswa'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new TextField(
                    controller: namaController,
                    decoration: new InputDecoration(
                        hintText: "Input Nama Mahasiswa",
                        labelText: "Nama Mahasiswa",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: npmController,
                    decoration: new InputDecoration(
                        hintText: "Input npm Mahasiswa",
                        labelText: "Input NPM",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: makulController,
                    decoration: new InputDecoration(
                        hintText: "Input Mata Kuliah ",
                        labelText: "Input Makul",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new TextField(
                    controller: sksController,
                    decoration: new InputDecoration(
                        hintText: "Input SKS",
                        labelText: "Input Sks",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: nilaiController,
                    decoration: new InputDecoration(
                        hintText: "Input Nilai",
                        labelText: "Input Nilai",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new RaisedButton(
                  child: new Text("Edit Data"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Login()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
