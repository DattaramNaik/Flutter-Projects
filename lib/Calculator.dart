import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Constant variable....
  var _formkey =GlobalKey<FormState>();
  final _minimumpad = 5.0;
  var _currencies =['Rupees','Dollor','Pounds'];
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayResult ='';
  var _currenciesItemSelected = '';
@override
  void initState(){
    super.initState();
    _currenciesItemSelected = _currencies[0];
  }
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        centerTitle: true,
        title: Text("Interest Calculator"),

      ),
      body: Form(
        key: _formkey,
        child:Padding(
          padding:EdgeInsets.all(_minimumpad*2) ,
        
        //list views.......
        child: ListView(
          children: <Widget>[
            getImage(),
            
            
            
            Padding(
                padding: EdgeInsets.only(top: _minimumpad,bottom: _minimumpad),
                child:TextFormField(
                  keyboardType: TextInputType.number,
                  controller: principalController,
                  validator: (String value){
                    if (value.isEmpty){
                      return 'Please Enter Principal Value';
                    }
                    final isDigitOnly = int.tryParse(value);
                    return isDigitOnly == null ? 'Enter Digit Only': null ;
                  },
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter principal',
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5.0)
                      )
                  ),
                )
            ),
            
            Padding(
                padding: EdgeInsets.only(top: _minimumpad,bottom: _minimumpad),
                child:TextFormField(
                  keyboardType: TextInputType.number,
                  controller: rateController,
                  validator: (String value){
                    if (value.isEmpty){
                      return 'Please Enter Interest Value';
                    }
                    final isDigitOnly = int.tryParse(value);
                    return isDigitOnly == null ? 'Enter Digit Only': null ;
                  },
                  decoration: InputDecoration(
                      labelText: 'Rate Of Interest',
                      hintText: 'In Percent',
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5.0)
                      )
                  ),
                )
            ),
            
            Padding(
                padding: EdgeInsets.only(top: _minimumpad,bottom: _minimumpad),
                child:Row(
                  children: <Widget>[
                    Expanded(
                        child:TextFormField(
                          keyboardType: TextInputType.number,
                          controller: termController,
                          validator: (String value){
                            if (value.isEmpty){
                              return 'Please Enter term Value';
                            }
                            final isDigitOnly = int.tryParse(value);
                            return isDigitOnly == null ? 'Enter Digit Only': null ;
                    
                          },
                          decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time In Years',
                              errorStyle:TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 15.0,

                              ) ,
                              border: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(5.0)
                              )
                          ),
                        )
                    ),
                    Container(width: _minimumpad*5,),
                    Expanded(
                        child:DropdownButton<String>(
                          items: _currencies.map((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: _currenciesItemSelected,
                          onChanged: (String newvalueselected){
                            _onDropDownItemSelected(newvalueselected);
                          },
                        )
                    )


                  ],
                )
            ),
            
            Padding(
                padding: EdgeInsets.only(top: _minimumpad,bottom: _minimumpad),
                child:Row(
                  children: <Widget>[
                    Expanded(
                        child:RaisedButton(
                          color: Colors.lightGreen,
                          child: Text('Calculate'),
                          textColor: Colors.white,
                          onPressed: (){
                            setState(() {
                              if (_formkey.currentState.validate()){
                              this.displayResult=_calculateTotalReturn();
                              }
                            });

                          },

                        )
                    ),
                    Container(width: _minimumpad*5.0,),
                    Expanded(
                        child:RaisedButton(
                          color: Colors.indigo,
                          child: Text('Reset'),
                          textColor: Colors.white,
                          onPressed: (){
                            setState(() {
                              _reset();
                            });

                          },

                        )
                    )


                  ],
                )
            ),
            Padding(
              padding: EdgeInsets.only(top: _minimumpad,bottom: _minimumpad),
              child: Text(displayResult),
            ),



          ],
        ),
      ),
    )
    );


  }
  // Logo image.....
  Widget getImage(){
    AssetImage assetImage = AssetImage("assets/images/page.png");
    Image image =Image(image: assetImage, width:125.0, height: 125.0,);
    return Container(child: image,margin:EdgeInsets.all(_minimumpad*10.0));
  }
  // Dropdownlist......
  void _onDropDownItemSelected(newvalueselected){
    setState(() {
      this._currenciesItemSelected = newvalueselected;
    });
  }
  // Calculation......
  String _calculateTotalReturn(){
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double time = double.parse(termController.text);
    
    double totalAmount = principal + (principal * rate * time)/100 ;
    String result ='After $time years, your investment will be worth $totalAmount $_currenciesItemSelected.';
    return result;
  }
  //reset buttons......
  void _reset(){
    principalController.text = '';
    rateController.text ='';
    termController.text = '';
    displayResult ='';
    _currenciesItemSelected =_currencies[0];
  }

}
