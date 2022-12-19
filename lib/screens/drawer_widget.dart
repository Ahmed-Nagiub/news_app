import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {

  Function drawerAction;
  static int CATEGORY_NUMBER=1;
  static int SETTING_NUMBER=2;
  DrawerWidget(this.drawerAction);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.80,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('New App!',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Icon(Icons.menu,size: 30,color: Colors.black,),
                SizedBox(width: 10,),
                InkWell(
                    onTap: (){
                      drawerAction(CATEGORY_NUMBER);
                    },
                    child: Text('Categories',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.settings,size: 30,color: Colors.black,),
                SizedBox(width: 10,),
                InkWell(
                    onTap: (){
                      drawerAction(SETTING_NUMBER);
                    },
                    child: Text('Settings',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
