import 'package:flutter/material.dart';

class MenuScreenWidget extends StatelessWidget {
  const MenuScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            // elevation: 0,
            centerTitle: true,
            title: const Text('Menu screen',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
          body:Column(
            children: [
              const SizedBox(height: 60,),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(245, 245, 248, 1)), /*Color.fromRGBO(245, 245, 248, 1)*/
                    foregroundColor: MaterialStateProperty.all(Color.fromRGBO(150, 165, 190, 1)), /*Color.fromRGBO(123, 141, 171, 1)*/
                    textStyle: MaterialStateProperty.all(
                      TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        // color: Colors.black,
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                    ),
                  ),
                  onPressed:() {
                    Navigator.pushNamed(context, '/setup_pin');
                  },
                  child: Text('Setup PIN'),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(245, 245, 248, 1)),
                    foregroundColor: MaterialStateProperty.all(Color.fromRGBO(150, 165, 190, 1)),
                    textStyle: MaterialStateProperty.all(
                      TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        // color: Colors.black,
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                    ),
                  ),
                  onPressed:(){
                    Navigator.pushNamed(context, '/authentication');
                  },
                  child: Text('Login'),
                ),
              ),
            ],

          ),
      ),
    );
  }
}
