part of 'main.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(20), // Rounded corners
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text("Quiz page"),
              ),
              TextFormField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelText: 'Search Topic',
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ), // Rounded corners
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Border when the field is focused
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ), // Rounded corners
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ), // Border color and width
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 30),
                width: 360,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

