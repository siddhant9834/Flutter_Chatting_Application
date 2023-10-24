import 'package:flutter/material.dart';
import 'package:my_chat_app/Model/CountryModel.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key, required this.setCountryData}) : super(key: key);

  final Function setCountryData;

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<CountryModel>country=[
    


      CountryModel(name: "India", code:"+91", flag:"🇩🇪"),
      CountryModel(name: "Pakistan", code: "+92", flag: "🇮🇱"),
            CountryModel(name: "India", code:"+91", flag:"🇮🇳"),
      CountryModel(name: "India", code:"+91", flag:"🇮🇳"),
      CountryModel(name: "India", code:"+91", flag:"🇮🇳"),
      CountryModel(name: "India", code:"+91", flag:"🇮🇳"),
      CountryModel(name: "India", code:"+91", flag:"🇮🇳"),
      CountryModel(name: "India", code:"+91", flag:"🇮🇳"),
      CountryModel(name: "India", code:"+91", flag:"🇮🇳"),
      // CountryModel(name: "Pakistan", code: "+92", flag: "PK"),
      // CountryModel(name: "India", code:"+91", flag:"IN"),
      // CountryModel(name: "Pakistan", code: "+92", flag: "PK"),

    // CountryPage(name: "India", code:"+91", flag:"IN"),
      // CountryPage(name: "India", code:"+91", flag:"IN"),
      // CountryPage(name: "India", code:"+91", flag:"IN"),
      // CountryPage(name: "India", code:"+91", flag:"IN"),
      // CountryPage(name: "India", code:"+91", flag:"IN"),
      // CountryPage(name: "India", code:"+91", flag:"IN"),
      // CountryPage(name: "India", code:"+91", flag:"IN"),
      // CountryPage(name: "India", code:"+91", flag:"IN"),
      // CountryPage(name: "India", code:"+91", flag:"IN"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color:Colors.teal)
          ),
        title: Text("Choose a country",
        style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w600,
              wordSpacing: 1,
              fontSize: 20),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                  color: Colors.teal,
                  ),
                  onPressed: () {},
                )
              ],
      ),
      body: ListView.builder(
          itemCount: country.length,
          itemBuilder: (context, index)=>card(country[index])),
    );
  }
  Widget card(CountryModel country){
    return InkWell(
      onTap: (){
        widget.setCountryData(country);
      },
      child: Card(
        margin: EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical:5,),
          child: Row(
            children: [
              Text(country.flag),
              SizedBox(width: 15),
              Text(country.name),
              // SizedBox(width: 15),
              Expanded(
                child: Container(
                      width: 150,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                        Text(country.code)

                    ],
                  ),
                )
                ),

            ],
          ),

        ),
      ),
    );
  }
 
}