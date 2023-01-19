import 'package:ekyam/adminScreens/admin_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SchemeCreationScreen extends StatefulWidget {
  const SchemeCreationScreen({Key? key}) : super(key: key);

  @override
  State<SchemeCreationScreen> createState() => _SchemeCreationScreenState();
}

class _SchemeCreationScreenState extends State<SchemeCreationScreen> {


  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  final schemeNameEditingController = new TextEditingController();
  final schemeCategoryEditingController = new TextEditingController();
  final aboutSchemeEditingController = new TextEditingController();
  final schemeDescriptionEditingController = new TextEditingController();
  String? issuedBySelectedValue ='Issued By';
  String? categorySelectedValue ='Category';


  @override
  Widget build(BuildContext context) {
    final schemeNameField = TextFormField(
      autofocus: false,
      controller: schemeNameEditingController,
      keyboardType: TextInputType.name,


      onSaved: (value) {
        schemeNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name of the Scheme",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )

      ),

    );
    final schemeCategoryDropdownButton = Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.8,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(Icons.wheelchair_pickup, color: Colors.grey,),
          SizedBox(width: 10),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(


              value: categorySelectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  categorySelectedValue = newValue;
                });
              },
              items: <String>['Category','Physical Disability', 'Mental Disability', 'Learning Disability', 'Hearing Impaired', 'Visually Impaired']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, selectionColor: Colors.grey),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
    final aboutNameField = TextFormField(
      autofocus: false,
      controller: aboutSchemeEditingController,
      keyboardType: TextInputType.emailAddress,

      onSaved: (value) {
        aboutSchemeEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Details about Scheme",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )

      ),

    );
    final descriptionNameField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: schemeDescriptionEditingController,
      keyboardType: TextInputType.visiblePassword,

      onSaved: (value) {
        schemeDescriptionEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Description of the Scheme",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )

      ),

    );
    var issuedByDropdownButton = Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.8,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(Icons.house, color: Colors.grey,),
          SizedBox(width: 10),
          DropdownButtonHideUnderline(

            child: DropdownButton<String>(
              value: issuedBySelectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  issuedBySelectedValue = newValue;
                });
              },
              items: <String>['Issued By','State ', 'Central ']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
    final submitButton = Material(
      color: Colors.greenAccent,
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(

        splashColor: Colors.green,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery
            .of(context)
            .size
            .width,

        onPressed: () {},
        child: Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
          ),
        ),

      ),

    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: Colors.white,),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                (context),
                MaterialPageRoute(
                    builder: (context) => const AdminHomeScreen()),
                    (route) => false);
          },
        ),
        title: Text("Create A New Scheme"),
        backgroundColor: Colors.greenAccent,
        elevation: 0,

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(height: 45),
                    schemeNameField,
                    SizedBox(height: 20),
                    schemeCategoryDropdownButton,
                    SizedBox(height: 20),
                    aboutNameField,
                    SizedBox(height: 20),
                    descriptionNameField,
                    SizedBox(height: 20),
                    issuedByDropdownButton,
                    SizedBox(height: 20),
                    submitButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


