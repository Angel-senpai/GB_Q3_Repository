//
//  main.swift
//  GeekBrainsQ3
//
//  Created by Даниил Мурыгин on 13.10.2019.
//  Copyright © 2019 Мурыгин Даниил. All rights reserved.
//

import Foundation

//MARK: Enum
enum EngineDo {
    case on, off
}
enum WindowDo {
    case open, close
}

enum Baggage{
    case addBaggage, getBaggage
}

enum Carcase{
    case open, close
}

//MARK: struct Car
struct Car{
    
    let mark: String
    let year: Date
    
    var color: CGColor
    private(set) var engine: EngineDo = .off
    private(set) var window: WindowDo = .close
    
    let weightCapasity: Double
    private(set) var filledWeight: Double = 0
    
    init(_ mark:String, _ year: Date, _ weightCapasity:Double, _ color:CGColor = CGColor.white) {
        self.mark = mark
        self.year = year
        self.weightCapasity = weightCapasity
        self.color = color
    }
    
    
    
    mutating func carWindow(_ state: WindowDo){
        self.window = state
    }
    
    mutating func carEngine(_ state: EngineDo){
        self.engine = state
    }
    
     mutating func fillOrGetBaggage(_ value: Double, _ action: Baggage){
           
           switch action {
               case .addBaggage where value <= 0:
                   print("В кузов добавлено дуновение ветра")
               case .addBaggage where filledWeight + value > weightCapasity:
                   print("Вместимость багажника превышена!")
               case .addBaggage:
                   filledWeight += value
                   
               case .getBaggage where value >= filledWeight:
                   filledWeight = 0
               case .getBaggage where value < 0:
               filledWeight += value
               case .getBaggage:
                   filledWeight -= value
           }
       }
    
    
}

//MARK: struct Honda
struct Honda{
    
    let mark: String = "Honda Accord"
    let year: Date
    
    var color: CGColor
    private(set) var engine: EngineDo = .off
    private(set) var window: WindowDo = .close
    
    
    let weightCapasity: Double = 2000
    private(set) var filledWeight: Double = 0
    
    
    init(color:CGColor = CGColor.white, buildDate: Date) {
        self.color = color
        self.year = buildDate
    }
    
    
    mutating func carWindow(_ state: WindowDo){
        self.window = state
    }
    
    mutating func carEngine(_ state: EngineDo){
        self.engine = state
    }
    
     mutating func fillOrGetBaggage(_ value: Double, _ action: Baggage){
           
           switch action {
               case .addBaggage where value <= 0:
                   print("В багажник добавлено дуновение ветра")
               case .addBaggage where filledWeight + value > weightCapasity:
                   print("Вместимость багажника превышена!")
               case .addBaggage:
                   filledWeight += value
                   
               case .getBaggage where value >= filledWeight:
                   filledWeight = 0
               case .getBaggage where value < 0:
               filledWeight += value
               case .getBaggage:
                   filledWeight -= value
           }
       }
    
}
//MARK: struct GAZel
struct GAZel{
    
    let mark: String = "ГАЗель"
    let year: Date
    
    let weightCapasity: Double = 10_000
    private(set) var filledWeight: Double = 0
    
    var color: CGColor
    private(set) var engine: EngineDo = .off
    private(set) var window: WindowDo = .close
    private(set) var carcase: Carcase = .close
    

    
    init(color:CGColor = CGColor.white, buildDate: Date) {
        self.color = color
        self.year = buildDate
    }
    
    mutating func carWindow(_ state: WindowDo){
        self.window = state
    }
    
    mutating func carEngine(_ state: EngineDo){
        self.engine = state
    }
    
    mutating func carCarcase(_ state: Carcase){
        self.carcase = state
    }
    
    mutating func fillOrGetBaggageInCarcase(_ value: Double, _ action: Baggage){
      switch action {
                  case .addBaggage where value <= 0:
                      print("В кузов добавлено дуновение ветра")
                  case .addBaggage where filledWeight + value > weightCapasity:
                      print("Вместимость багажника превышена!")
                  case .addBaggage:
                      filledWeight += value
                      
                  case .getBaggage where value >= filledWeight:
                      filledWeight = 0
                  case .getBaggage where value < 0:
                  filledWeight += value
                  case .getBaggage:
                      filledWeight -= value
                  }
        }
    
}

var gaz = GAZel(buildDate: Date())

print(gaz)
gaz.carEngine(.on)
gaz.carWindow(.open)
print(gaz)
gaz.color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
gaz.fillOrGetBaggageInCarcase(100, .addBaggage)
print(gaz)
gaz.fillOrGetBaggageInCarcase(250, .getBaggage)
print(gaz)
gaz.fillOrGetBaggageInCarcase(0, .addBaggage)

var car = Car("MonsterCar", Date(), 2_500)
car.carEngine(.on)
car.fillOrGetBaggage(2500, .addBaggage)
print(car)

var h = Honda(color: .black, buildDate: Date())
h.carWindow(.open)
h.fillOrGetBaggage(250, .addBaggage)
h.fillOrGetBaggage(100, .getBaggage)
print(h)
