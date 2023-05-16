import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/assets/image_constants.dart';
import '../../../widgets/button/custom_cupertino_button.dart';
import '../../../widgets/snackbar/custom_snackbar.dart';
import '../../../widgets/textFormField/custom_auth_text_form_field.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  final TextEditingController textEditingController = TextEditingController();
  List<int> divisors = [];
  var rng = Random();
  PageController controller = PageController();

  int randomIndex = 0;

  void createRandomIndex() {
    setState(() {
      randomIndex = rng.nextInt(6);
    });
    print(divisors[randomIndex]);
  }

  List<int> findDivisors(int number) {
    divisors = [];
    for (int i = 2; i <= (number / 2); i++) {
      if (number % i == 0) {
        divisors.add(i);
      }
    }
    divisors.add(1);
    divisors.add(number);
    return divisors;
  }

  void createRandomNumber() {
    var find = findDivisors(rng.nextInt(1000));
    while (find.length != 6) {
      find = findDivisors(rng.nextInt(1000));
    }
  }

  @override
  void initState() {
    createRandomNumber();
    createRandomIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Ağaçlardaki Sayılar'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: controller,
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            divisors.last.toString(),
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Image.asset(ImageConstants.instance.tree, width: 100.w),
                          starWidget(1.h, 37.w, randomIndex == 0 ? '?' : divisors[0].toString()),
                          starWidget(10.h, 48.w, randomIndex == 1 ? '?' : divisors[1].toString()),
                          starWidget(12.h, 28.w, randomIndex == 2 ? '?' : divisors[2].toString()),
                          starWidget(20.h, 50.w, randomIndex == 3 ? '?' : divisors[3].toString()),
                          starWidget(22.h, 28.w, randomIndex == 4 ? '?' : divisors[4].toString()),
                          starWidget(29.h, 38.w, randomIndex == 5 ? '?' : divisors[5].toString()),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Ağaçta yıldız içindeki sayılar ağacın üstünde kırmızı daire içinde olan sayıyı tam bölen sayılardır. Soru işareti (?) içindeki eksik olan sayı kaçtır ?',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 40.w,
                    height: 7.h,
                    child: CustomAuthTextFormField(
                      hintText: '?',
                      textInputType: TextInputType.number,
                      controller: textEditingController,
                    )),
                SizedBox(
                    width: 50.w,
                    height: 7.h,
                    child: CustomCupertinoButton.filled(
                        child: const Text('İleri'),
                        onPressed: () {
                          if (textEditingController.text == '') {
                            CustomSnackBar().snackBar(
                              context: context,
                              message: 'Lütfen bulduğunuz cevabı kutuya yazınız!',
                              icon: Icons.warning,
                              backgroundColor: Colors.orange,
                              borderColor: Colors.orange.shade900,
                            );
                          } else {
                            if (divisors[randomIndex].toString() == textEditingController.text) {
                              CustomSnackBar().snackBar(
                                context: context,
                                message: 'Cevabınız doğru sıradakı soru geldi :)',
                                icon: Icons.check,
                                backgroundColor: Colors.green,
                                borderColor: Colors.green.shade900,
                              );
                              createRandomIndex();
                              createRandomNumber();
                              textEditingController.text = '';
                              FocusScope.of(context).requestFocus(FocusNode());
                            } else {
                              CustomSnackBar().snackBar(
                                context: context,
                                message: 'Maalesef bilemediniz tekrar düşünün. :(',
                                icon: Icons.error,
                                backgroundColor: Colors.red,
                                borderColor: Colors.red.shade900,
                              );
                            }
                          }
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }

  Positioned starWidget(double top, double left, String number) {
    return Positioned(
        top: top,
        left: left,
        child: Stack(
          children: [
            const Icon(
              Icons.star,
              size: 100,
              color: Colors.yellow,
            ),
            Positioned(
                left: number != '?' && int.parse(number) > 99 ? 32 : 38,
                top: 38,
                child: Text(
                  number,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ));
  }
}
