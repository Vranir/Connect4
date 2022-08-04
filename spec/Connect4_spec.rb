require_relative '../lib/Connect4_game.rb'

describe Connect4 do
    #test makeGrid
    subject(:game){described_class.new("ana","ivo",6,7)}
    describe '#makeGrid' do        
        context 'default grid size' do

            defoultgrid=[[ " ", " ", " ", " ", " ", " ", " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "]]
            it 'returns a 6*7 grid of whitespace'do
                newGrid=game.makeGrid()
                expect(newGrid).to eq(defoultgrid)
            end
        end

        context 'custom grid size' do

            customgrid=[[ " ",  " "], [ " ",  " "], [ " ",  " "]]
            it 'returns a 2*3 grid of whitespace'do
            newGrid=game.makeGrid(2,3)
            expect(newGrid).to eq(customgrid)
            end
        end
    end

    #check victory test
    describe '#checkVictory' do
        #check horizontal
        it 'reutrns x' do
            grid=[[ " ", " ", " ", " ", " ", " ", " "],
                    [ " ",  "x",  "x",  "x",  "x",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "]]
            expect(game.checkVictory(1,1,grid)).to eq("x")
        end

        it 'return y' do
            grid=[[ " ", " ", " ", " ", " ", " ", " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  "x",  " ",  " ",  " "],
                    [ "y",  "y",  "y",  "y",  " ",  " ",  " "],
                    [ "x",  "x",  "x",  "y",  "x",  "x",  " "]]
            expect(game.checkVictory(4,0,grid)).to eq("y")
        end

        it 'returns nil' do
            grid=[[ " ", " ", " ", " ", " ", " ", " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  "x",  " ",  " ",  " "],
                    [ "y",  "y",  "y",  "y",  "x",  "x",  " "],
                    [ "x",  "x",  "x",  "y",  "x",  "x",  " "]]
            expect(game.checkVictory(4,4,grid)).to eq(nil)
        end

        it 'returns nil' do
            grid=[[ " ", " ", " ", " ", " ", " ", " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  "x",  " ",  " ",  " "],
                    [ " ",  "y",  "y",  "y",  " ",  " ",  " "],
                    [ "x",  "x",  "x",  "y",  "x",  "x",  " "]]
            expect(game.checkVictory(5,0,grid)).to eq(nil)
        end
        #check vertical
        it 'vertical reutrns x' do
            grid=[[ " ", " ", " ", " ", " ", " ", " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  "x",  " ",  " ",  " ",  " "]]
            expect(game.checkVictory(2,2,grid)).to eq("x")
        end

        it 'vertical return y' do
            grid=[[ " ", " ", " ", " ", " ", " ", " "],
                    [ "y",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ "y",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ "y",  " ",  " ",  "x",  " ",  " ",  " "],
                    [ "y",  "y",  "x",  "y",  " ",  " ",  " "],
                    [ "x",  "x",  "x",  "y",  "x",  "x",  " "]]
            expect(game.checkVictory(1,0,grid)).to eq("y")
        end

        it 'vertical returns nil' do
            grid=[[ " ", " ", " ", " ", " ", " ", " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ "y",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ "y",  " ",  " ",  "x",  " ",  " ",  " "],
                    [ "y",  "x",  "y",  "y",  "x",  "x",  " "],
                    [ "x",  "x",  "x",  "y",  "x",  "x",  " "]]
            expect(game.checkVictory(2,0,grid)).to eq(nil)
        end

        it 'vertical returns nil' do
            grid=[[ " ", " ", " ", " ", " ", " ", " "],
                    [ " ",  " ",  " ",  " ",  " ",  "x",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  "x",  " "],
                    [ " ",  " ",  " ",  "x",  " ",  "x",  " "],
                    [ " ",  "y",  "y",  "y",  " ",  "y",  " "],
                    [ "x",  "x",  "x",  "y",  "x",  "x",  " "]]
            expect(game.checkVictory(5,1,grid)).to eq(nil)
        end

        #diagonal 
        it 'diagonal reutrns x' do
            grid=[  [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  "x",  " ",  "x",  " ",  " ",  " "],
                    [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  "x",  " ",  " ",  " "],
                    [ "x",  " ",  " ",  " ",  "x",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "]]
            expect(game.checkVictory(2,2,grid)).to eq("x")
        end
        it 'diagonal reutrns x' do
            grid=[  [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  "x",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                    [ " ",  "x",  " ",  "x",  " ",  " ",  " "],
                    [ "x",  " ",  " ",  " ",  "x",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "]]
            expect(game.checkVictory(2,2,grid)).to eq("x")
        end
        it 'diagonal reutrns nil' do
            grid=[  [ "x",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  "x",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  "x",  " ",  "x",  " ",  " ",  " "],
                    [ "x",  " ",  " ",  " ",  "x",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "]]
            expect(game.checkVictory(0,0,grid)).to eq(nil)
        end
        it 'diagonal reutrns nil' do
            grid=[  [ "x",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  "x",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                    [ " ",  "x",  " ",  "x",  " ",  " ",  " "],
                    [ "x",  " ",  " ",  " ",  "x",  "y",  " "],
                    [ " ",  " ",  " ",  " ",  " ",  " ",  "y"]]
            expect(game.checkVictory(4,5,grid)).to eq(nil)
        end

        describe '#droptoken' do
            it 'drop test empty grid' do
                grid=[  [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "]]
                expect(game.dropToken("x",2,grid)).to eq(5)
                expect(grid).to eq(
                    [  [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "]])
            
            end

            it 'drop test med grid' do
                grid=[  [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "]]
                expect(game.dropToken("x",2,grid)).to eq(3)
                expect(grid).to eq(
                    [  [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  " ",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "]])
                
            
            end

            it 'drop test full grid' do
                grid=[  [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "]]
                expect(game.dropToken("x",2,grid)).to eq(false)
                expect(grid).to eq(
                    [  [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "],
                        [ " ",  " ",  "x",  " ",  " ",  " ",  " "]])
                
            
            end
        end

    end
end

