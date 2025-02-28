import 'package:flutter/material.dart';
import 'package:onboarding_ui/data/data.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff231f1e),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
                itemCount: contents.length,
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;

                  });
                },
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Image.asset(contents[index].image),
                        const Spacer(),
                        Text(
                          contents[index].title,
                          style: const TextStyle(
                            fontFamily: 'Gilroy-Bold',
                            fontSize: 28,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          textAlign: TextAlign.center,
                          contents[index].description,
                          style: const TextStyle(
                            fontFamily: 'Gilroy-Regular',
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],

                    ),
                  );
                }
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex:2),
                ElevatedButton(
                    onPressed: (){
                      if (currentIndex== contents.length-1){}
                      _controller!.nextPage(duration:const Duration(milliseconds: 500), curve:Curves.easeInOut  );},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffef895f),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:40,vertical:17),
                      child: Text( currentIndex== contents.length-1?"Get Started"
                       :"Next"),
                    ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(contents.length,
                          (index)=> buildDot(index, context),
                  )
                ),
                const Spacer(),
              ],
            )

          ),
        ],
      ),

    );
  }
  AnimatedContainer buildDot(int index,BuildContext context ){
  return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: 5,
      width: currentIndex==index?24:6,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex==index? Color(0xffef895f): Colors.white ,
      )
  );
  }

}
