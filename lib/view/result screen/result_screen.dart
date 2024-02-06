import 'package:flutter/material.dart';
import 'package:git_sample/utilis/color_constant.dart';
import 'package:git_sample/utilis/question_db.dart';
import 'package:git_sample/view/question%20screen/question_screen.dart';

void main() {}

class ResultScreen extends StatelessWidget {
  // const ResultScreen({super.key});
  int count;
  ResultScreen({required this.count});

  @override
  Widget build(BuildContext context) {
    int totalQn = Questiondb.questions.length;
    double percentage = (count / totalQn) * 100;
    return Scaffold(
      backgroundColor: Colorconstant.mycoustomblack,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "congrats!",
              style:
                  TextStyle(color: Colorconstant.mycoustomwhite, fontSize: 30),
            ),
            Text(
              "${percentage}%score",
              style:
                  TextStyle(color: Colorconstant.mycoustomgreen, fontSize: 30),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colorconstant.mycoustomorange),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(),
                    ));
              },
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
