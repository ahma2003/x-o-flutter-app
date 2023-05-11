import 'package:flutter/material.dart';
import 'package:x_o_game/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = 'X';
  static bool gameOver = false;
  int turn = 0;
  String result = 'XXXXXXXXXXXXXX';
  Game game = Game();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
                activeColor: Colors.blue,              
                value: isSwitched, 
                onChanged: (bool newValue) {
                  setState(() {
                    isSwitched = newValue ;
                  });
                },
                title: Text(
                   textAlign : TextAlign.center ,
                  'turn on/off two player',
                  style: TextStyle(
                    color: Colors.white , 
                    fontSize: 28,
                    ),
                  ),

                ),
                Text( 'I\'ts $activePlayer turn'.toUpperCase() ,
                   textAlign : TextAlign.center ,
                  style: const TextStyle(
                    color: Colors.white , 
                    fontSize: 50,
                    ),
                  ),

                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.fromLTRB(8, 30, 8, 0),
                      crossAxisCount: 3,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7,
                      children: List.generate(9, (index) => 
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: gameOver ? null :() => onTap(index) ,
                        child: Container (
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).shadowColor
                          ),
                          child: Center(
                            child: Text (
                              Player.playerX.contains(index) ? 'X' : Player.playerO.contains(index) ? 'O' : ' '  ,
                              style: TextStyle(
                                color: Player.playerX.contains(index) ? Colors.red : Colors.blue ,
                                fontSize: 70 ,
                                fontWeight: FontWeight.w400
                              ),
                          ),
                          ),
                        ),
                      )
                      ),
                      )
                    
                    ),

                  Text( result ,
                   textAlign : TextAlign.center ,
                  style: const TextStyle(
                    color: Colors.white , 
                    fontSize: 42,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32)
                  ),
                  child: ElevatedButton.icon(
                    onPressed: (){
                    setState(() {
                    activePlayer = 'X';
                    gameOver = false;
                    turn = 0;
                    result = '';
                    Player.playerO = [] ;
                    Player.playerX = [] ;
                    });
                  }, 
                  icon: Icon(
                    Icons.replay,
                    size: 36,), 
                  label: Text(
                    'repeat',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold
                    ),
                    )),
                ),
                  SizedBox(
                    height: 20,
                  )
                  
                  
          ],
        ),
      ),
    );
  }
  
   onTap(int index)  async {

    if (!Player.playerO.contains(index) && !Player.playerX.contains(index)){
      Game.playGame(index, activePlayer)  ;
      updateState();
      if (isSwitched == false && gameOver == false) {
        await Game.autoPlay(activePlayer) ;
        updateState();
      }
    }
}

    void updateState() {
    return setState(() {
      activePlayer = activePlayer == 'X' ? 'O' : 'X' ;
      String winner =  Game.checkWinner();
      if (winner == 'X' || winner =='O') {
        result = "$winner is the winner" ;
        gameOver = true ; 
      }
      else if (Player.playerO.length + Player.playerX.length == 9) 
      {
        result = 'It is a DRAW' ;
        gameOver = true ; 
      }
 });
  }
}