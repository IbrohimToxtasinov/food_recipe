import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/food_bloc/get_foods_bloc.dart';
import 'package:food_recipe/bloc/food_bloc/get_foods_event.dart';
import 'package:food_recipe/ui/home_page/home_page.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

int calories = 10;
TextEditingController controller = TextEditingController();

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Calories : ", style: TextStyle(fontSize: 18),),
                ElevatedButton(
                  onPressed: () {
                    if(calories > 10){
                      setState(() {
                        calories -=10;
                      });
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
                Text(calories.toString(),style: TextStyle(fontSize: 18),),
                ElevatedButton(
                  onPressed: () {
                    if(calories < 1000){
                      setState(() {
                        calories +=10;
                      });
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              context.read<GetFoodsBloc>().add(
                    FetchAllFoods(
                      controller.text,
                      calories.toString(),
                    ),
                  );
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
            child: Container(
                width: 300,
                height: 40,
                child: Center(child: const Text("Next"))),
          )
        ],
      ),
    );
  }
}
