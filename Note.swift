func play(theGame game: Mastermind) {
        var turnNumber = 0
        game.playing = true
        var playerLine : Line
        var result : Array<Int>
        
        let startDate = Date()
        
        while(turnNumber < 12 && game.playing) {
            while !self.push{}
            playerLine = validBlockColors()
            // ---
            result = playerLine.result(compareTo: game.code)
            
            // --- Print the line and his result (A REMPLACER)
            print("player plays: \(playerLine) | \(result)")
            // ---
            if result[0] == 4 {
                game.playing = false
                game.playerWin = true
            }
            else {
                turnNumber += 1
            }
            game.lines.append(playerLine)
            game.results.append(result)
        }
        if game.playing {game.playing = false}
        let elapsed = Date().timeIntervalSince(startDate)
        game.elapsedTime = elapsed
        print("duration: \(elapsed)")
        
        
        if game.playerWin {
            print("The player wins ! Good game !")
            game.score = (12 - turnNumber)*10 + Int(elapsed/100)
            winMessage(score: game.score)
            print("score = \(game.score)")
        } else {
            print("The player lost ! Maybe another time !")
            loseMessage()
        }
        
    }