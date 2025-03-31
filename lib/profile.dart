part of 'main.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "Maths": 4,
      "Biology": 4.5,
      "Physics": 5.5,
      "Chemistry": 6
    };

    final colorList = <Color>[
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.redAccent,
      Colors.orangeAccent
    ];
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
               child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Use full screen width
                  height: MediaQuery.of(context).size.width *
                      0.40, // Set height relative to width

                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark ? baseDark :baseLight,

                      border: Border.all(color: Theme.of(context).brightness ==Brightness.light ? tealLight : tealDark,width: 2,),
                      borderRadius: BorderRadius.circular(20)),
                      
                  child: Center(
                    child: Row(children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                // Circle size
                                backgroundImage: NetworkImage(
                                    "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid",
                                    scale: 1
                                    // Correct URL
                                    ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 0, top: 20),
                          child: Column(
                            children: [
                              Text(
                                "User Name",style: TextStyle(fontWeight: FontWeight.bold),
                                                              ),
                              Text(
                                "Sylabuss: SSLC",
                                style: TextStyle(
                                    
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 5,
                                ),
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  label: const Text('Edit details'),
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          Color.fromRGBO(24, 19, 84, 1)),
                                ),
                              )
                            ],
                          )),
                    ]),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Material(
                child: Stack(
                  children: [
                    // Container with the background and content
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: Theme.of(context).brightness ==Brightness.light ? tealLight : tealDark,width: 2,),

                          color: Theme.of(context).brightness == Brightness.dark ? baseDark :baseLight,
                        ),
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: 400,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Statistics",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,),
                                  
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: PieChart(
                                dataMap: dataMap,
                                chartType: ChartType.ring,
                                baseChartColor:
                                    Colors.grey[50]!.withOpacity(0.15),
                                colorList: colorList,
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true,
                                ),
                                totalValue: 100,
                              ),
                            )
                          ],
                        ),
                      ),

                    // InkWell on top of the container
                    Positioned.fill(
                      child: InkWell(
                        hoverColor: Color.fromRGBO(112, 56, 242, 0),
                        splashColor: Theme.of(context).cardColor,
                        onTap: () {
                          Navigator.pop(context, QuizPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}

