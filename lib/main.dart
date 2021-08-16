import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext acontext) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
        primaryColor: Colors.white
      ),
      home: MyHomePage(title: '컨설팅 시작하기'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Matter {YES, NO}

class _MyHomePageState extends State<MyHomePage> {

  String? fieldsValue = '음악';
  List<String> fields = <String>['음악','법률','재무','경영'];

  String? careerValue = '경력 1년 이상';
  List<String> carrers = <String>['경력 1년 이상','경력 3년 이상','경력 5년 이상','경력 10년 이상'];

  Matter _matter = Matter.NO;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1. 컨설팅을 원하는 분야를 선택하세요.',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0),
                            height: 50.0,
                            child: DropdownButton(
                              value: fieldsValue,
                              icon: Icon(Icons.arrow_drop_down),
                              items: fields.map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              style: TextStyle(color: Colors.black, fontSize: 13),
                              onChanged: (String? newValue){
                                setState(() {
                                  fieldsValue = newValue;
                                });
                              },

                            ),
                          ),

                          Text(
                            '2. 원하는 컨설턴트의 경력을 선택하세요.',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0),
                            height: 50.0,
                            child: DropdownButton(
                              value: careerValue,
                              icon: Icon(Icons.arrow_drop_down),
                              items: carrers.map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              style: TextStyle(color: Colors.black, fontSize: 13),
                              onChanged: (String? newValue){
                                setState(() {
                                  careerValue = newValue;
                                });
                              },

                            ),
                          ),
                          Text(
                            '3. 컨설턴트의 관련 자격증 유무를 선택하세요.',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 15.0),
                              height: 50.0,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 130, child: RadioListTile(
                                      title: Text('있음',textAlign: TextAlign.start,style: TextStyle(fontSize: 13,color: Colors.black)),
                                      value: Matter.YES,
                                      groupValue: _matter,
                                      onChanged: (Matter? value){
                                        setState(() {
                                          _matter = value!;
                                        });
                                      }
                                  )),
                                  SizedBox(width: 150, child: RadioListTile(
                                      title: Text('상관없음',style: TextStyle(fontSize: 13,color: Colors.black)),
                                      value: Matter.NO,
                                      groupValue: _matter,
                                      onChanged: (value){
                                        setState(() {
                                          _matter = value as Matter;
                                        });
                                      }
                                  )),
                                ],
                              )
                          ),

                          Text(
                            '4. 컨설턴트의 인원을 선택하세요 .',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15.0),
                              height: 50.0,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 90, child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: '1',
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4)

                                    ),
                                  )),
                                  Text('      ~      ', style: TextStyle(fontSize: 13,color: Colors.black),),
                                  SizedBox(width: 90, child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: '5',
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4)

                                    ),
                                  )),
                                  Text('      명      ', style: TextStyle(fontSize: 13,color: Colors.black),),
                                ],
                              )
                          ),
                          Text(
                            '5. 1인당 지불할 비용의 범위를 선택하세요',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15.0),
                              height: 50.0,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 90, child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: '30000',
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4)

                                    ),
                                  )),
                                  Text('      ~      ', style: TextStyle(fontSize: 13,color: Colors.black),),
                                  SizedBox(width: 90, child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: '50000',
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4)

                                    ),
                                  )),
                                  Text('      원      ', style: TextStyle(fontSize: 13,color: Colors.black),),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        // style: ButtonStyle(
                        //   shape: MaterialSta
                        // ),
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.indigo, Colors.blue]),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            width: 100,
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'START',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        )
                    )

                  ],
                ),
              ),
            ))
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
