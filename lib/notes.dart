
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
                Theme.of(context).brightness == Brightness.dark ?  'asset/${subjectsList[i]}.svg' :  'asset/${subjectsList[i]}_light.svg',
                                  fit: BoxFit.cover,                width: 40,
                height: 40,
              ),
              title: Text(subjectsList[i]),
              onTap: (){
               Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoteMenu( subjectName: subjectsList[i],)),
                        ); 
              },
            );
          },
        ),
      ),
    );
  }
}

