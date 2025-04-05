part of 'main.dart';
class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  Color tile_color =ThemeProvider().themeMode == ThemeMode.dark? mantleDark:mantleLight; 
bool isSelected =false ;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Select Topics")),
      floatingActionButton: isSelected ? FloatingActionButton.extended(onPressed: (){}, label:Text( "Start")):null,
      body: SingleChildScrollView(physics:ScrollPhysics(),child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 20,itemBuilder: (context,i){
      return Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child:  ListTile(selected:isSelected ,title: Text("Topic one",textAlign: TextAlign.center,),tileColor:ThemeProvider().themeMode == ThemeMode.dark? mantleDark:mantleLight  ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Theme.of(context).brightness == Brightness.dark ? lavenderDark : lavenderLight)),onLongPress:toggleSelection ,), );

      }),)
    );

  }
void toggleSelection() {
    setState(() {
      if (isSelected) {
        tile_color=ThemeProvider().themeMode == ThemeMode.dark? mantleDark:mantleLight; 
        isSelected = false;
      } else {
       tile_color=ThemeProvider().themeMode == ThemeMode.dark? surface1Dark:surface1Light; 
        isSelected = true;
      }
    });
  }
}



