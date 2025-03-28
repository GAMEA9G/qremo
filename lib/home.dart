part of 'main.dart';

class HomePageNew extends StatelessWidget {
  const HomePageNew({super.key});

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
              // Removed SizedBox for extra space here
              // Horizontal Scroll View with recommended topics
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
                    color: Theme.of(context).textTheme.bodySmall!.color,
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
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 60) /
                                        3,
                                height:
                                    (MediaQuery.of(context).size.width - 60) /
                                        3,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: mauve,
                                      blurRadius: 8.0,
                                    ),
                                  ],
                                ),
                                child: SvgPicture.asset(
                                  'asset/${subjectsList[i]}.svg', // Make sure the path is correct
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                subjectsList[i],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: text),
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

