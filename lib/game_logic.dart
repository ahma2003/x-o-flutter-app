import 'dart:math';

class Player {
  static List<int> playerX = [] ;
  static List<int> playerO = [] ;
}

extension ContainsAll on List {
      bool containsAll ( int x , int y , [int? z]){
        if (z == null) {
          return contains(x) && contains(y) ;
        }
        else{
        return contains(x) && contains(y) && contains(z) ; 
        }      
      }
}


class Game {



  static void playGame (int index , String activePlayer ) {
    if (activePlayer == 'X') 
      Player.playerX.add(index) ;
    else 
      Player.playerO.add(index);
  }



  static String checkWinner() {
    String winner = '' ;
    if ( 
      Player.playerX.containsAll(0 , 1 , 2) ||
      Player.playerX.containsAll(3 , 4 , 5) ||
      Player.playerX.containsAll(6 , 7 , 8) ||
      Player.playerX.containsAll(0 , 1 , 2) ||
      Player.playerX.containsAll(0 , 3 , 6) ||
      Player.playerX.containsAll(1 , 4 , 7) ||
      Player.playerX.containsAll(2 , 5 , 8) ||
      Player.playerX.containsAll(2 , 5 , 8) ||
      Player.playerX.containsAll(0 , 4 , 8) ||
      Player.playerX.containsAll(2 , 4 , 6)  
     ) {

      
      
      return winner = 'X' ;
    }
    else if (
      Player.playerO.containsAll(0 , 1 , 2) ||
      Player.playerO.containsAll(3 , 4 , 5) ||
      Player.playerO.containsAll(6 , 7 , 8) ||
      Player.playerO.containsAll(0 , 1 , 2) ||
      Player.playerO.containsAll(0 , 3 , 6) ||
      Player.playerO.containsAll(1 , 4 , 7) ||
      Player.playerO.containsAll(2 , 5 , 8) ||
      Player.playerO.containsAll(2 , 5 , 8) ||
      Player.playerO.containsAll(0 , 4 , 8) ||
      Player.playerO.containsAll(2 , 4 , 6)  
    ){
      return winner = 'O' ;
    }
    else {
      return winner ;
    }


  }



  static Future  autoPlay  (String activePlayer)  async {
    int index = 0 ;
    Random random = Random() ;
///////////////////////////////////////////////////////////// Attacking    
    //Attack the Row 
    if (Player.playerO.containsAll(0 , 1) && !Player.playerO.contains(2) && !Player.playerX.contains(2) ) 
      index = 2 ;
    else if (Player.playerO.containsAll(3 , 4) && !Player.playerO.contains(5) && !Player.playerX.contains(5) ) 
      index = 5 ;    
    else if (Player.playerO.containsAll(6, 7) && !Player.playerO.contains(8) && !Player.playerX.contains(8) ) 
      index = 8 ; 
    else if (Player.playerO.containsAll(0 , 2) && !Player.playerO.contains(1) && !Player.playerX.contains(1) ) 
      index = 1 ;   
    else if (Player.playerO.containsAll(3 , 5) && !Player.playerO.contains(4) && !Player.playerX.contains(4) ) 
      index = 4 ;     
    else if (Player.playerO.containsAll(6 , 8) && !Player.playerO.contains(7) && !Player.playerX.contains(7) ) 
      index = 7 ;    
    else if (Player.playerO.containsAll(1 , 2) && !Player.playerO.contains(0) && !Player.playerX.contains(0) ) 
      index = 0 ;        
    else if (Player.playerO.containsAll(4 , 5) && !Player.playerO.contains(3) && !Player.playerX.contains(3) ) 
      index = 3 ;  
    else if (Player.playerO.containsAll(7 , 8) && !Player.playerO.contains(6) && !Player.playerX.contains(6) ) 
      index = 6 ;  
    // Attack the Column 
    else if (Player.playerO.containsAll(0 , 3) && !Player.playerO.contains(6) && !Player.playerX.contains(6) ) 
      index = 6 ;   
    else if (Player.playerO.containsAll(1 , 4) && !Player.playerO.contains(7) && !Player.playerX.contains(7) ) 
      index = 7 ;  
    else if (Player.playerO.containsAll(2 , 5) && !Player.playerO.contains(8) && !Player.playerX.contains(8) ) 
      index = 8 ;  
    else if (Player.playerO.containsAll(0 , 6) && !Player.playerO.contains(3) && !Player.playerX.contains(3) ) 
      index = 3 ;  
    else if (Player.playerO.containsAll(1 , 7) && !Player.playerO.contains(4) && !Player.playerX.contains(4) ) 
      index = 4 ;  
    else if (Player.playerO.containsAll(2 , 8) && !Player.playerO.contains(5) && !Player.playerX.contains(5) ) 
      index = 5 ; 
    else if (Player.playerO.containsAll(3 , 6) && !Player.playerO.contains(0) && !Player.playerX.contains(0) ) 
      index = 0 ; 
    else if (Player.playerO.containsAll(4 , 7) && !Player.playerO.contains(1) && !Player.playerX.contains(1) ) 
      index = 1 ;       
    else if (Player.playerO.containsAll(5 , 8) && !Player.playerO.contains(2) && !Player.playerX.contains(2) ) 
      index = 2 ; 
    // Attack the Cross
    else if (Player.playerO.containsAll(0 , 8) && !Player.playerO.contains(4) && !Player.playerX.contains(4) ) 
      index = 4 ; 
    else if (Player.playerO.containsAll(0 , 4) && !Player.playerO.contains(8) && !Player.playerX.contains(8) ) 
      index = 8 ; 
    else if (Player.playerO.containsAll(4 , 8) && !Player.playerO.contains(0) && !Player.playerX.contains(0) ) 
      index = 0 ; 
    else if (Player.playerO.containsAll(2 , 4) && !Player.playerO.contains(6) && !Player.playerX.contains(6) ) 
      index = 6 ; 
    else if (Player.playerO.containsAll(2 , 6) && !Player.playerO.contains(4) && !Player.playerX.contains(4) ) 
      index = 4 ;             
    else if (Player.playerO.containsAll(4 , 6) && !Player.playerO.contains(2) && !Player.playerX.contains(2) ) 
      index = 2 ; 

//////////////////////////////////////////////////// Defending 
    // Defence the Row 
    else if (Player.playerX.containsAll(0 , 1) && !Player.playerO.contains(2) && !Player.playerX.contains(2) ) 
      index = 2 ;
    else if (Player.playerX.containsAll(3 , 4) && !Player.playerO.contains(5) && !Player.playerX.contains(5) ) 
      index = 5 ;    
    else if (Player.playerX.containsAll(6, 7) && !Player.playerO.contains(8) && !Player.playerX.contains(8) ) 
      index = 8 ; 
    else if (Player.playerX.containsAll(0 , 2) && !Player.playerO.contains(1) && !Player.playerX.contains(1) ) 
      index = 1 ;   
    else if (Player.playerX.containsAll(3 , 5) && !Player.playerO.contains(4) && !Player.playerX.contains(4) ) 
      index = 4 ;     
    else if (Player.playerX.containsAll(6 , 8) && !Player.playerO.contains(7) && !Player.playerX.contains(7) ) 
      index = 7 ;    
    else if (Player.playerX.containsAll(1 , 2) && !Player.playerO.contains(0) && !Player.playerX.contains(0) ) 
      index = 0 ;        
    else if (Player.playerX.containsAll(4 , 5) && !Player.playerO.contains(3) && !Player.playerX.contains(3) ) 
      index = 3 ;  
    else if (Player.playerX.containsAll(7 , 8) && !Player.playerO.contains(6) && !Player.playerX.contains(6) ) 
      index = 6 ;  
    // Defence the Column 
    else if (Player.playerX.containsAll(0 , 3) && !Player.playerO.contains(6) && !Player.playerX.contains(6) ) 
      index = 6 ;   
    else if (Player.playerX.containsAll(1 , 4) && !Player.playerO.contains(7) && !Player.playerX.contains(7) ) 
      index = 7 ;  
    else if (Player.playerX.containsAll(2 , 5) && !Player.playerO.contains(8) && !Player.playerX.contains(8) ) 
      index = 8 ;  
    else if (Player.playerX.containsAll(0 , 6) && !Player.playerO.contains(3) && !Player.playerX.contains(3) ) 
      index = 3 ;  
    else if (Player.playerX.containsAll(1 , 7) && !Player.playerO.contains(4) && !Player.playerX.contains(4) ) 
      index = 4 ;  
    else if (Player.playerX.containsAll(2 , 8) && !Player.playerO.contains(5) && !Player.playerX.contains(5) ) 
      index = 5 ; 
    else if (Player.playerX.containsAll(3 , 6) && !Player.playerO.contains(0) && !Player.playerX.contains(0) ) 
      index = 0 ; 
    else if (Player.playerX.containsAll(4 , 7) && !Player.playerO.contains(1) && !Player.playerX.contains(1) ) 
      index = 1 ;       
    else if (Player.playerX.containsAll(5 , 8) && !Player.playerO.contains(2) && !Player.playerX.contains(2) ) 
      index = 2 ; 
    // Defence the Cross
    else if (Player.playerX.containsAll(0 , 8) && !Player.playerO.contains(4) && !Player.playerX.contains(4) ) 
      index = 4 ; 
    else if (Player.playerX.containsAll(0 , 4) && !Player.playerO.contains(8) && !Player.playerX.contains(8) ) 
      index = 8 ; 
    else if (Player.playerX.containsAll(4 , 8) && !Player.playerO.contains(0) && !Player.playerX.contains(0) ) 
      index = 0 ; 
    else if (Player.playerX.containsAll(2 , 4) && !Player.playerO.contains(6) && !Player.playerX.contains(6) ) 
      index = 6 ; 
    else if (Player.playerX.containsAll(2 , 6) && !Player.playerO.contains(4) && !Player.playerX.contains(4) ) 
      index = 4 ;             
    else if (Player.playerX.containsAll(4 , 6) && !Player.playerO.contains(2) && !Player.playerX.contains(2) ) 
      index = 2 ; 

    // just pick any available cell
    else {
    do {
      index = random.nextInt(9)  ;
    } 
    while (Player.playerX.length != 5 && ( Player.playerO.contains(index) || Player.playerX.contains(index)) );
    }  
      playGame(index, activePlayer);
      activePlayer = 'X' ;

  }

  
}