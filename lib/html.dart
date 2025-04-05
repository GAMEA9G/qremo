part of 'main.dart';
class HtmlNote extends StatefulWidget {
  const HtmlNote({super.key});

  @override
  State<HtmlNote> createState() => _HtmlNoteState();
}

class _HtmlNoteState extends State<HtmlNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(
        'https://drive.google.com/uc?export=view&id=1Id4bVTQNsjXF_ttJ1_Y-OrRWbZ4nMB-y',
        
      ),    );
  }
}
