import 'package:flutter/material.dart';
import 'package:quizzler/quizpage.dart';

class interpage extends StatefulWidget {
  const interpage({key}) : super(key: key);

  @override
  State<interpage> createState() => _interpageState();
}

class _interpageState extends State<interpage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  sexybutton(1),
                  sexybutton(2),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  sexybutton(3),
                  sexybutton(4),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
class sexybutton extends StatelessWidget {
  final int n;
  const sexybutton(this.n,{key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
          child: Ink.image(
            image: AssetImage("assets/show$n.jpeg",),
            width: 170,
            height: 170,
            fit: BoxFit.cover,
          ),
        onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute (
              builder: (BuildContext context) => QuizPage(),
            ),
            );
        },
        splashColor: Colors.black26,
      ),
      borderRadius: BorderRadius.circular(200),
    );
  }
}



// InkWell(
// child: ElevatedButton(
// clipBehavior: Clip.antiAlias,
// child: Container(
// child: InkWell(child: Image.asset("assets/show$n.jpeg",fit: BoxFit.cover)),
// height: 170,
// width: 170,
// ),
// onPressed: () {},
// style: ElevatedButton.styleFrom(
// padding: EdgeInsets.zero,
// fixedSize: const Size(170, 170),
// shape: const CircleBorder(),
// ),
// ),
// splashColor: Colors.black87,
// );
// InkWell(
// child: CircleAvatar(
// backgroundImage: AssetImage("assets/show$n.jpeg"),
// radius: 70,
// ),
// );