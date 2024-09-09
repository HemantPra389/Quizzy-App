import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questionsList;
  const QuizScreen({super.key, required this.questionsList});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _pageController = PageController();
  int currentQuestionIndex = 0;
  Map<String, String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: size.width * .7,
                    child: LinearProgressIndicator(
                      value: (currentQuestionIndex + 1) /
                          widget.questionsList.length,
                    ),
                  ),
                  Text(
                    "${currentQuestionIndex + 1}/${widget.questionsList.length}",
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(height: size.height * .1),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.questionsList.length,
                  itemBuilder: (context, index) {
                    final question = widget.questionsList[index];
                    return Column(
                      children: [
                        Container(
                          height: size.height * .2,
                          width: size.width * .9,
                          padding: const EdgeInsets.all(12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            question.questionText,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Column(
                          children: question.options.map((option) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                width: size.width * .9,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.blueAccent.withOpacity(.4),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      option.optionText,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    if (selectedOptions[question.questionId] ==
                                        option.optionId)
                                      const Icon(Icons.check_circle,
                                          color: Colors.blueAccent)
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  width: size.width * .9,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    currentQuestionIndex < widget.questionsList.length - 1
                        ? "Next"
                        : "Submit",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
