
part of 'main.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  //Example list, adjust as needed

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Notes",
            textAlign: TextAlign.center,
          ),
          automaticallyImplyLeading: false,
        ), 
        body: ListView.builder(
          itemCount: subjectsList.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: SvgPicture.asset(
                'asset/${subjectsList[i]}.svg',
                width: 40,
                height: 40,
              ),
              title: Text(subjectsList[i]),
            );
          },
        ),
      ),
    );
  }
}

