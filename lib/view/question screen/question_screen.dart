// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:git_sample/utilis/color_constant.dart';
import 'package:git_sample/utilis/question_db.dart';
import 'package:git_sample/view/result%20screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionindex = 0;
  int? selectedindex;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorconstant.mycoustomblack,
        appBar: AppBar(
          backgroundColor: Colorconstant.mycoustomblack,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "${questionindex + 1}/${Questiondb.questions.length}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colorconstant.mycoustomblue),
              ),
            ),
          ],
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colorconstant.mycoustomgrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                Questiondb.questions[questionindex]["question"],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colorconstant.mycoustomwhite),
              )),
            ),
            SizedBox(
              height: 80,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectedindex = index;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          // color: getRightAnswer(index),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: getRightAnswer(index))),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Questiondb.questions[questionindex]["options"]
                                  [index],
                              style: TextStyle(
                                  color: Colorconstant.mycoustomwhite),
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colorconstant.mycoustomgrey,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colorconstant.mycoustomblack,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemCount: 4),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                // questionindex++;
                // setState(() {});
                if (selectedindex != null &&
                    selectedindex ==
                        Questiondb.questions[questionindex]["answer"]) {
                  count++;
                }
                selectedindex = null;
                if (questionindex < Questiondb.questions.length - 1) {
                  questionindex++;
                  setState(() {});
                } else {
                  // print("correct answers:$count");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(count: count)));
                }
              },
              child: Container(
                height: 50,
                width: 450,
                decoration: BoxDecoration(
                    color: Colorconstant.mycoustomblue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colorconstant.mycoustomwhite),
                  ),
                ),
              ),
            )
          ]),
        )));
  }

  //get colour on right answer
  Color getRightAnswer(int index) {
    if (selectedindex != null &&
        index == Questiondb.questions[questionindex]["answer"]) {
      return Colorconstant.mycoustomgreen;
    }
    if (selectedindex == index) {
      if (selectedindex == Questiondb.questions[questionindex]["answer"]) {
        return Colorconstant.mycoustomgreen;
      } else {
        return Colorconstant.mycoustomred;
      }
    } else {
      return Colorconstant.mycoustomgrey;
    }
  }
}
