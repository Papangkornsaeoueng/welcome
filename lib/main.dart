//652021059 ปภังกร แซ่อึ่ง
import 'package:flutter/material.dart';

void main() {
  runApp(MyTranslatorApp());
}

class MyTranslatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // นี่คือส่วนที่เพิ่มเข้าไป
      title: 'Translator App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blueAccent,
        ),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
            color: Colors.black87,
          ),
        ),
      ),
      home: TranslatorHomePage(),
    );
  }
}

class TranslatorHomePage extends StatefulWidget {
  @override
  _TranslatorHomePageState createState() => _TranslatorHomePageState();
}

class _TranslatorHomePageState extends State<TranslatorHomePage> {
  String translatedText = '';
  bool isThai = true; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20),
              TextField(
                maxLines: 5,
                onChanged: (value) {
                  setState(() {
                    translatedText = translateText(value);
                  });
                },
                decoration: InputDecoration(
                  labelText: 'ป้อนข้อความที่ต้องการแปล',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'ผลลัพธ์: $translatedText',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isThai = !isThai; 
                  });
                },
                child: Text(isThai ? 'เปลี่ยนเป็นภาษาอังกฤษ' : 'Switch to Thai'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String translateText(String text) {
    if (isThai) {
      
      return text.split('').reversed.join();
    } else {
      return text; 
    }
  }
}
