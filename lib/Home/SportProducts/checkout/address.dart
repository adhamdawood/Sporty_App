import 'package:flutter/material.dart';
import 'package:sporty_app/Home/SportProducts/checkout/checkout.dart';

class Address extends StatefulWidget {
  const Address({Key key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
        title: Text("Address",style: TextStyle(fontSize: 14 ,color: Colors.black,fontWeight: FontWeight.w600),),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15,end: 15,top: 40 ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("City",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    )),
                TextFormField(
                  decoration: InputDecoration(suffixIcon: Icon(Icons.keyboard_arrow_down_outlined)),
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value.isEmpty)
                    {
                      return ' city must not be empty';

                    }
                    return null;

                  } ,

                ),
                SizedBox(height: 30,),
                Text("Street",
                  style: TextStyle(color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),),
                TextFormField(keyboardType: TextInputType.streetAddress,
                  validator: (value){
                    if(value.isEmpty)
                    {
                      return ' street must not be empty';

                    }
                    return null;

                  } ,
                ),
                SizedBox(height: 30,),
                Text("Building",
                    style: TextStyle(color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    )),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onTap: (){},
                  validator: (value){
                    if(value.isEmpty)
                    {
                      return 'expiration date must not be empty';

                    }
                    return null;

                  } ,

                ),
                // Spacer(),
                SizedBox(height: 240,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  Material(
                    color: Color(0xffE20030),
                    borderRadius: BorderRadius.circular(10.0),
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState.validate()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>Checkout()),);
                        }

                      },
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .05,
                        decoration: BoxDecoration(),
                        child:  Center(child: Text(  'Update' ,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),)),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
