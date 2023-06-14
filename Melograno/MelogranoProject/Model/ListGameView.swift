//
//  ListGameView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import SwiftUI

struct ListGameView: View {
    var game : Game
    @State var level : Level
    
    @State var fulls : [GameBoxPosition] = []
    
    @State var bottoms : [GameBoxPosition] = []
    
    @State var tops : [GameBoxPosition] = []
    @State var gameBalls:[ColoreBottone] = []
    
    
    var body: some View {
        VStack{
            if game.type == .cronological{
                CronoGameView(fulls: $fulls, bottoms: $bottoms, tops: $tops, level: $level)
            }
            else if game.type == .association{
                AssociateGameView(fulls: $fulls, bottoms: $bottoms, tops: $tops, level: $level)
            }
            else if game.type == .balls{
                if level == .level1{
                    GameBallsLevel1(circlesNumber: 3,bottoni: $gameBalls)
                }
                else if level == .level2{
                    GameBallsLevel1(circlesNumber: 4,bottoni: $gameBalls)
                }
                else if level == .level3{
                    GameBallsLevel1(circlesNumber: 5,bottoni: $gameBalls)
                }
            }
            else if game.type == .memory{
                if level == .level1{
                    CardMemoryGameView(numberOfCards: 2)
                }
                else if level == .level2{
                    CardMemoryGameViewLevel2(numberOfCards: 3)
                }
                else if level == .level3{
                    CardMemoryGameViewLevel3(numberOfCards: 4)
                }
                
                
            }
        }.onAppear{
            if game.type == .cronological{
                if level == .level1{
                    let gamesLevel : [[CronoDecoding]] = load(type: "Crono1")
                    let selectedGame = gamesLevel.randomElement()
                    let shuffled = selectedGame?.shuffled()
                    fulls = [GameBoxPosition(x:dynamicWidth(353), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(1013), y:dynamicHeight(382))]
                    for index in fulls.indices{
                        fulls[index].corectIndex = shuffled![index].correctIndex
                        fulls[index].image = shuffled![index].imageName
                        
                    }
                    bottoms = [GameBoxPosition(x:dynamicWidth(353), y:dynamicHeight(722)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(722)),GameBoxPosition(x:dynamicWidth(1013), y:dynamicHeight(722))]
                    
                    tops = [GameBoxPosition(x:dynamicWidth(353), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(1013), y:dynamicHeight(382))]
                }
                else if level == .level2{
                    let gamesLevel : [[CronoDecoding]] = load(type: "Crono2")
                    let selectedGame = gamesLevel.randomElement()
                    let shuffled = selectedGame?.shuffled()
                    fulls = [GameBoxPosition(x:dynamicWidth(188), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(518), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(848), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(1178),y:dynamicHeight(382))]
                    for index in fulls.indices{
                        fulls[index].corectIndex = shuffled![index].correctIndex
                        fulls[index].image = shuffled![index].imageName
                    }
                    bottoms = [GameBoxPosition(x:dynamicWidth(188), y:dynamicHeight(722)),GameBoxPosition(x:dynamicWidth(518), y:dynamicHeight(722)),GameBoxPosition(x:dynamicWidth(848), y:dynamicHeight(722)),GameBoxPosition(x:dynamicWidth(1178), y:dynamicHeight(722))]
                    
                    tops = [GameBoxPosition(x:dynamicWidth(188), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(518), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(848), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(1178), y:dynamicHeight(382))]
                }
                else if level == .level3{
                    let gamesLevel : [[CronoDecoding]] = load(type: "Crono3")
                    let selectedGame = gamesLevel.randomElement()
                    let shuffled = selectedGame?.shuffled()
                    fulls = [GameBoxPosition(x:dynamicWidth(343), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(1023), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(513), y:dynamicHeight(567)),GameBoxPosition(x:dynamicWidth(853),y:dynamicHeight(567))]
                    
                    bottoms = [GameBoxPosition(x:dynamicWidth(223), y:dynamicHeight(818)),GameBoxPosition(x:dynamicWidth(453), y:dynamicHeight(818)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(818)),GameBoxPosition(x:dynamicWidth(913), y:dynamicHeight(818)),GameBoxPosition(x:dynamicWidth(1143),y:dynamicHeight(818))]
                    
                    for index in fulls.indices{
                        fulls[index].corectIndex = shuffled![index].correctIndex
                        fulls[index].image = shuffled![index].imageName
                    }
                    
                    let shuffled2 = selectedGame?.shuffled()
                    
                    for index in bottoms.indices{
                        bottoms[index].image = shuffled2![index].imageName
                    }
                    
                    tops = [GameBoxPosition(x:dynamicWidth(343), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(1023), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(513), y:dynamicHeight(567)),GameBoxPosition(x:dynamicWidth(853),y:dynamicHeight(567))]
                }
            }
            else if game.type == .association{
                if level == .level1{
                    let gamesLevel : [[CronoDecoding]] = load(type: "Ass1")
                    let selectedGame = gamesLevel.randomElement()
                    let shuffled = selectedGame?.shuffled()
                    fulls = [GameBoxPosition(x:dynamicWidth(353), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(1013), y:dynamicHeight(382))]
                    
                    bottoms = [GameBoxPosition(x:dynamicWidth(353), y:dynamicHeight(776)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(776)),GameBoxPosition(x:dynamicWidth(1013), y:dynamicHeight(776))]
                    
                    for index in fulls.indices{
                        fulls[index].image = shuffled![index].imageName
                    }
                    let shuffled2 = selectedGame?.shuffled()
                    
                    for index in bottoms.indices{
                        bottoms[index].image = shuffled2![index].imageName
                    }
                    tops = [GameBoxPosition(x:dynamicWidth(353), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(1013), y:dynamicHeight(382))]
                    
                }
                else if level == .level2{
                    let gamesLevel : [[CronoDecoding]] = load(type: "Ass2")
                    let selectedGame = gamesLevel.randomElement()
                    let shuffled = selectedGame?.shuffled()
                    fulls = [GameBoxPosition(x:dynamicWidth(188), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(518), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(848), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(1178),y:dynamicHeight(382))]
                    
                    bottoms = [GameBoxPosition(x:dynamicWidth(188), y:dynamicHeight(776)),GameBoxPosition(x:dynamicWidth(518), y:dynamicHeight(776)),GameBoxPosition(x:dynamicWidth(848), y:dynamicHeight(776)),GameBoxPosition(x:dynamicWidth(1178), y:dynamicHeight(776))]
                    
                    for index in fulls.indices{
                        fulls[index].image = "\(shuffled![index].imageName)extra"
                    }
                    let shuffled2 = selectedGame?.shuffled()
                    
                    for index in bottoms.indices{
                        bottoms[index].image = shuffled2![index].imageName
                    }
                    tops = [GameBoxPosition(x:dynamicWidth(188), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(518), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(848), y:dynamicHeight(382)),GameBoxPosition(x:dynamicWidth(1178), y:dynamicHeight(382))]
                    
                }
                else if level == .level3{
                    let gamesLevel : [[CronoDecoding]] = load(type: "Ass3")
                    let selectedGame = gamesLevel.randomElement()
                    let shuffled = selectedGame?.shuffled()
                    fulls = [GameBoxPosition(x:dynamicWidth(343), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(1023), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(513), y:dynamicHeight(567)),GameBoxPosition(x:dynamicWidth(853),y:dynamicHeight(567))]
                    
                    bottoms = [GameBoxPosition(x:dynamicWidth(223), y:dynamicHeight(818)),GameBoxPosition(x:dynamicWidth(453), y:dynamicHeight(818)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(818)),GameBoxPosition(x:dynamicWidth(913), y:dynamicHeight(818)),GameBoxPosition(x:dynamicWidth(1143),y:dynamicHeight(818))]
                    
                    for index in fulls.indices{
                        fulls[index].image = shuffled![index].imageName
                    }
                    let shuffled2 = selectedGame?.shuffled()
                    
                    for index in bottoms.indices{
                        bottoms[index].image = shuffled2![index].imageName
                    }
                    tops = [GameBoxPosition(x:dynamicWidth(343), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(683), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(1023), y:dynamicHeight(334)),GameBoxPosition(x:dynamicWidth(513), y:dynamicHeight(567)),GameBoxPosition(x:dynamicWidth(853),y:dynamicHeight(567))]
                    
                }
            }else if game.type == .balls{
                
                if level == .level1{
                    gameBalls = [ColoreBottone(coloresopra: .redOff, coloredopo: .redOff, coloresotto: .redDown, coloreop: .redOn, suono: "a",name: "a"),ColoreBottone(coloresopra: .greenOff, coloredopo: .greenOff, coloresotto: .greenDown, coloreop: .greenOn, suono: "b",name: "b"),  ColoreBottone(coloresopra: .blueOff, coloredopo: .blueOff, coloresotto: .blueDown, coloreop: .blueOn, suono: "c",name: "c")]
                }
                else if level == .level2{
                    gameBalls = [ColoreBottone(coloresopra: .redOff, coloredopo: .redOff, coloresotto: .redDown, coloreop: .redOn, suono: "a",name: "a"), ColoreBottone(coloresopra: .greenOff, coloredopo: .greenOff, coloresotto: .greenDown, coloreop: .greenOn, suono: "b",name: "b"),  ColoreBottone(coloresopra: .blueOff, coloredopo: .blueOff, coloresotto: .blueDown, coloreop: .blueOn, suono: "c",name: "c"), ColoreBottone(coloresopra: .yellowOff, coloredopo: .yellowOff, coloresotto: .yellowDown, coloreop: .yellowOn, suono: "d",name: "d")]
                }
                else if level == .level3{
                    gameBalls = [ColoreBottone(coloresopra: .redOff, coloredopo: .redOff, coloresotto: .redDown, coloreop: .redOn, suono: "a",name: "a"), ColoreBottone(coloresopra: .greenOff, coloredopo: .greenOff, coloresotto: .greenDown, coloreop: .greenOn, suono: "b",name: "b"),  ColoreBottone(coloresopra: .blueOff, coloredopo: .blueOff, coloresotto: .blueDown, coloreop: .blueOn, suono: "c",name: "c"), ColoreBottone(coloresopra: .yellowOff, coloredopo: .yellowOff, coloresotto: .yellowDown, coloreop: .yellowOn, suono: "d",name: "d"), ColoreBottone(coloresopra: .orangeOff, coloredopo: .orangeOff, coloresotto: .orangeDown, coloreop: .orangeOn, suono: "e",name: "e")]
                }
            }
        }
    }
}
struct ListGameView_Previews: PreviewProvider {
    static var previews: some View {
        ListGameView(game:Game(name: "", description: "", image: "", type: .association),level: .level1)
    }
}


