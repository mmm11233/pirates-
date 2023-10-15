protocol CargoManaging {
    func addCargo(cargoItem: String)
    func removeCargo(cargoItem: String)
    func listCargo() -> [String]
}

protocol CrewManaging {
    func addCrew(member: String)
    func removeCrew(member: String)
    func listCrew() -> [String]
}



class CargoManager: CargoManaging {
    private var cargo: [String] = []
    
    func addCargo(cargoItem: String) {
        cargo.append(cargoItem)
    }
    
    func removeCargo(cargoItem: String) {
        cargo = cargo.filter { $0 != cargoItem }
    }
    
    func listCargo() -> [String] {
        return cargo
    }
}



class CrewManager: CrewManaging {
    private var crew: [String] = []
    
    func addCrew(member: String) {
        crew.append(member)
    }
    
    func removeCrew(member: String) {
        crew = crew.filter { $0 != member }
    }
    
    func listCrew() -> [String] {
        return crew
    }
}

protocol Cannons {
    func fireCannon(count: Int)
}



class PirateShip: Cannons {
    let name: String
    let cannonsCount: Int
    var cargoManager: CargoManaging
    var crewManager: CrewManaging
    
    init(name: String, cannonsCount: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.cargoManager = cargoManager
        self.crewManager = crewManager
    }
    
    func addCargo(cargoItem: String) {
        cargoManager.addCargo(cargoItem: cargoItem)
    }
    
    func removeCargo(cargoItem: String) {
        cargoManager.removeCargo(cargoItem: cargoItem)
    }
    
    func listCargo() -> [String] {
        return cargoManager.listCargo()
    }
    
    func addCrew(member: String) {
        crewManager.addCrew(member: member)
    }
    
    func removeCrew(member: String) {
        crewManager.removeCrew(member: member)
    }
    
    func listCrew() -> [String] {
        return crewManager.listCrew()
    }
    
    func fireCannon(count: Int) {
        print("Firing \(count) cannons!")
    }
}



class TreasureMap {
    let x: Int
    let y: Int
    var treasureCoordinates: (Int, Int)
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.treasureCoordinates = (Int.random(in: 1...x), Int.random(in: 1...y))
    }
    
    func hintToTreasure(x: Int, y: Int) -> String {
        if x == treasureCoordinates.0 && y == treasureCoordinates.1 {
            return "Finally you found the treasure! <3 "
        } else {
            let hintX = treasureCoordinates.0 > x ? "you can go North" : "you can go West"
            let hintY = treasureCoordinates.1 > y ? "you can go East" : "you can go South"
            return "\(hintX), \(hintY)"
        }
    }
}



class SeaAdventure {
    let adventureType: String
    
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print("ship embarked on \(adventureType) adventure!")
    }
}



class PirateCode {
    private func discussTerms(term: String) {
        print("Negotiations started: \(term)")
    }
    
    func parley(term: String) {
        discussTerms(term: term)
        print("Parley: \(term)")
    }
    
    func mutiny(term: String) {
        discussTerms(term: term)
        print("Mutiny: \(term)")
    }
}



let cargoManager = CargoManager()
let crewManager = CrewManager()

let pirateShip = PirateShip(name: "black Swan", cannonsCount: 20, cargoManager: cargoManager, crewManager: crewManager)

pirateShip.addCargo(cargoItem: "Gold")
pirateShip.addCargo(cargoItem: "silver")
pirateShip.addCrew(member: "mariami")
pirateShip.addCrew(member: "rezo")

let treasureMap = TreasureMap(x: 100, y: 100)
let x = 55
let y = 45

let hint = treasureMap.hintToTreasure(x: x, y: y)
print("Treasure Map Hint: \(hint)")

let seaAdventure = SeaAdventure(adventureType: "A dangerous attack")
seaAdventure.encounter()

let pirateCode = PirateCode()
pirateCode.parley(term: "Transfer of treasure")
pirateCode.mutiny(term: "Fire the cannons")

pirateShip.fireCannon(count: 20)



//პირველ რიგში დავიწყოთ ჩვენი საგანძურის ძებნით შევქმნათ ორი ცვლადი საწყისი კოორდინატები საიდანაც ჩვენი გემი აიღებს გეზს, და treasureMap-ის hintToTreasure მეთოდის გამოყენებით ვეცადოთ ვიპოვოთ ჩვენი საგანძური.
//
//
//
//საგანძურის პოვნის შემდეგ გადააწყდება adventure-ს, დავბეჭდოთ რა adventure-ა, PirateCode-ს გამოყენებით გადავწყვიტოთ რას იზამს ჩვენი კაპიტანი, ეცდება აარიდოს თავი თავგადასავალს თუ მიხვდება რომ აზრი არ აქვს მოლაპარაკებებს და შეუტევს? არჩევის შემდეგ რის განხილვას მოახდენს თავის ეკიპაჟთან ერთად? როგორ გაიქცეს თუ როგორ შეუტიოს ეფექტურად? გამოიყენებს ის ყველა არსებულ cannon-ს ხომალდზე თუ არა?
//
//
//
//ამ რთულ გადაწყვეტილების მიღების შემდეგ ჩვენ უკვე ვეღარასდროს ვერ გავიგებთ თუ როგორ დამთავრდა ჩვენი კაპიტნის და მისი ეკიპაჟის ამბავი.😄
