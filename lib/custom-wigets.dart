part of 'main.dart';


class ThemedBox extends StatelessWidget {

  final Widget? child;

  final double height ;
  final EdgeInsetsGeometry margin;

  const ThemedBox({Key? key,  this.child , required this.height,this.margin= EdgeInsets.zero}) : super(key: key);


  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Color borderColor = Theme.of(context).brightness == Brightness.dark ? lavenderDark :lavenderLight;
    Color boxColor = Theme.of(context).brightness == Brightness.dark ? mantleDark :mantleLight;



    return Container(width: width,height: height,decoration: BoxDecoration(color:boxColor, border: Border.all(color:borderColor ,width: 2), borderRadius: BorderRadius.circular(20)),child: child,margin: margin,); }

}  

