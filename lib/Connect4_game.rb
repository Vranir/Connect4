class Connect4
    def initialize(player1, player2, row, column)
        @player1={name: player1, token: "\u25CB"}
        @player2={name: player2, token: "\u25CF"}
        @grid=makeGrid(row,column)        
    end      
    

    def play
        turn=1
        puts "Game has started! It's "+@player1[:name]+" as "+@player1[:token] +" vs "+@player2[:name]+" as "+@player2[:token]+"."
        drawGrid(@grid)
        loop do
            puts "Turn "+turn.to_s            
            break if turn(@player1)
            puts "Awesome move, "+@player1[:name]
            
            break if turn(@player2)
            puts "Wow that was unexpected, "+@player2[:name]            
            turn+=1           

        end
    end

    def turn(player)
        puts player[:name]+" choose column to drop token in!"
        column=gets.to_i-1
        row=dropToken(player[:token],column,@grid)        
        loop do
            if row
                drawGrid(@grid)
                if checkVictory(row,column,@grid)
                    puts "The "+player[:token]+"'s have it! "+player[:name]+" wins!"
                    return true
                end
                break
            else
                puts "Wrong move. You must choose a valid column, non-full, column. Try again!"
                column=gets.to_i-1
                row=dropToken(player[:token],column,@grid)
            end
        end
        return false 
    end


    def drawGrid(grid)
        puts "\n"
        puts "  "+[*1..grid[0].length].join("  ")
        grid.each { |row|
            puts "\u2551"+row.join(" \u2551")+" \u2551"
            
            }
    end
    
    def dropToken(token,column,grid)
        if column>grid.length || column<0
            return false
        end        
        row=grid.length-1
        while row>=0 do
            if grid[row][column]==' '
                grid[row][column]=token.to_s
                return row
            end
            row-=1
        end 
        return false
    end
    
    def makeGrid(rows=7,columns=6)
        grid=[]
        for c in 0..columns-1
            grid.push([])
            for r in 0..rows-1
                grid[c].push(" ")
            end
        end
        grid
    end
    
    def checkVictory(posR,posC,grid)
        #check if position contains token
        #return nil if grid[posR][posC]==" "
    
        #determine player
        player=grid[posR][posC]
    
        #horizontal check
        rowString=grid.join()
        if rowString.include? player.to_s*4
            return player
        end
        #vertical check
        columnString=""
        for i in 0..grid.length-1        
            columnString+=grid[i][posC].to_s
        end    
        if columnString.include? player.to_s*4
            return player
        end
    
        #diagonal desc check
        x=posR-1
        y=posC-1
        diagonalString=grid[posR][posC].to_s
        while x>=0 && y>=0 && x<grid.length && y<grid[0].length
            #puts x.to_s+ " "+y.to_s
            diagonalString=grid[x][y].to_s+diagonalString
            x-=1
            y-=1
            
        end
        x=posR+1
        y=posC+1
        while y<grid[0].length && x<grid.length && x>=0 && y>=0
            #puts x.to_s+ " "+y.to_s
            diagonalString+=grid[x][y].to_s
            x+=1
            y+=1
            
        end
        #puts "X"+diagonalString+"X"
        if diagonalString.include? player.to_s*4
            return player
        end
    
        
        #diagonal asc check
        x=posR+1
        y=posC-1
        diagonalString=grid[posR][posC].to_s
        while x>=0 && y>=0 && x<grid.length && y<grid[0].length
            #puts x.to_s+ " "+y.to_s
            diagonalString=grid[x][y].to_s+diagonalString
            x+=1
            y-=1
            
        end
        x=posR-1
        y=posC+1
        while x<grid.length && y<grid[0].length && x>=0 && y>=0
            #puts x.to_s+ " "+y.to_s
            diagonalString+=grid[x][y].to_s
            x-=1
            y+=1
            
        end
        #puts "X"+diagonalString+"X"
        if diagonalString.include? player.to_s*4
            return player
        end
    
        #no victory
        return nil
    end

end


