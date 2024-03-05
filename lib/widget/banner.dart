import 'package:flutter/material.dart';

class blackBanner extends StatefulWidget {
  const blackBanner({super.key});

  @override
  State<blackBanner> createState() => _blackBannerState();
}

class _blackBannerState extends State<blackBanner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:11.0,vertical: 11),
      child: 
        ClipRRect(    borderRadius: BorderRadius.circular(20),
        child: Container(color: Colors.black,height: 120,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 2 ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Image.network("https://images.pexels.com/photos/1456740/pexels-photo-1456740.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Discout 50%",style: TextStyle(color: Colors.grey,fontSize: 25),),
                Text("learn more ...",style: TextStyle(color: Colors.grey,fontSize: 15))
              ],)
            ],),
          ),
        ),)),
        
      

    );
  }
}