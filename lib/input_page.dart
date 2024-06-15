import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const ActivecardColour = Color(0xFF1D1E33);
const InActivecardColour = Color(0xFF111320);
const bottomContainerheight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = InActivecardColour;
  Color femaleCardColor = InActivecardColour;

  void UpdateCardColor(int gender){
    if(gender == 1){
      if(maleCardColor == InActivecardColour){
        maleCardColor =ActivecardColour;
        femaleCardColor = InActivecardColour;
      }else{
        maleCardColor =InActivecardColour;
      }
    }else{
      if(femaleCardColor == InActivecardColour){
        femaleCardColor =ActivecardColour;
        maleCardColor =InActivecardColour;
      }else{
        femaleCardColor =InActivecardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          UpdateCardColor(1);
                          print('gesture tap');
                        });

                      },
                      child: ReuseableCard(
                      colour: maleCardColor,
                      cardChild: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF8d8e98)

                          ),
                        )
                      ],
                      ),
                      ),
                    )),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          UpdateCardColor(2);
                          print('gesture 2 clicked');
                        });

                      },
                      child: ReuseableCard(
                        colour: femaleCardColor,
                        cardChild: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 80.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFF8d8e98)

                              ),
                            )
                          ],
                        ),
                                      ),
                    )),
              ],
            )),
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: const Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0)),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReuseableCard(
                  colour: ActivecardColour,
                      cardChild: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFF8d8e98)

                            ),
                          )
                        ],
                      ),
                )),
                Expanded(
                    child: ReuseableCard(
                  colour: ActivecardColour,
                  cardChild: const Column(),
                )),
              ],
            )),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              color: bottomContainerColor,
              width: double.infinity,
              height: bottomContainerheight,
            )
          ],
        ));
  }
}

class ReuseableCard extends StatelessWidget {
  ReuseableCard({required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}

//Color(0xFF1D1E33)
