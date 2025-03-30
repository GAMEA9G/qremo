part of 'main.dart';


class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNew();
}
class _HomePageNew extends State<HomePageNew> with WidgetsBindingObserver {
  
  
  Key Svgkey = UniqueKey();
   Brightness _brightness = Brightness.dark;
   void resetIcon() {
    setState(() {
      Svgkey = UniqueKey();
    });
  } 
  @override
  void initState() {
    Svgkey = UniqueKey();

        WidgetsBinding.instance?.addObserver(this);

    super.initState();

  }
  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
  }
  @override
  void didChangePlatformBrightness() {
    
    
    setState(() {
          Svgkey = UniqueKey();
          
        });
        
 

    super.didChangePlatformBrightness();
  }
   @override
  Widget build(BuildContext context) {
        

        return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Recommented",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: RecommendedTopicCard(
                        title: 'Subject ${index + 1}',
                        description: 'Description of Subject ${index + 1}',
                        imageUrl: 'https://via.placeholder.com/150',
                      ),
                    );
                  }),
                ),
              ),
              // Adding a SizedBox to ensure there's space between elements

              SizedBox(height: 10.0),
              Text(
                "Subjects",
                textAlign: TextAlign.left,
                style: TextStyle(
                    
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 15.0,
                children: [
                  for (var i = 0; i < subjectsList.length; i++)

                    // Only include subjects for i <= 3
                    GestureDetector(
                      onTap: () {
                        print("clicked Subject ${subjectsList[i]}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubjectMenu(
                                    nameOfSubject: subjectsList[i],
                                    searchButton: false,
                                  )),
                        ); // Change subject number based on the loop
                      },
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                                Stack(children: [

                                               Container(
                                width:
                                    
                                    (MediaQuery.of(context).size.width -60 ) /
                                        3,
                                height:
                                    (MediaQuery.of(context).size.width - 60) /
                                        3,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color:ThemeProvider().themeMode == ThemeMode.dark ? mauveDark : mauveLight ,
                                      blurRadius: 8.5,
                                    ),
                                  ],
                                ),
                                child: SvgPicture.asset(
                                
                                  Theme.of(context).brightness == Brightness.dark ?  'asset/${subjectsList[i]}.svg' :  'asset/${subjectsList[i]}_light.svg',
                                  fit: BoxFit.cover,key:Svgkey ,
                                )),
                               SleekCircularSlider(appearance: CircularSliderAppearance(customColors: CustomSliderColors(progressBarColor: Theme.of(context).brightness == Brightness.light ? peachLight :peachDark ,shadowColor: baseDark) ,customWidths: CustomSliderWidths(progressBarWidth: 5,handlerSize: 0,),size: (MediaQuery.of(context).size.width -60) /3),min: 0,max: 100,initialValue: 50 ,innerWidget: (double value){var roundvalue = value.toStringAsFixed(1); return Column(children: [SizedBox(height:(MediaQuery.of(context).size.width -110) /3),Text('$roundvalue %' ,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold))],);},),

                  ],),                             


                          
                                                            Text(
                                subjectsList[i],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          )),
                    )
                ],
              ),
              SizedBox(height: 18.0),
            ],
          ),
        ),
      ),
    );
  }
}

