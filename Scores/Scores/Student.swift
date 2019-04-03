//
//  Student.swift
//  Scores
//
//  Created by Nicholas Yee on 2/27/19.
//  Copyright © 2019 Nicholas Yee. All rights reserved.
//

import Foundation

class Student : NSObject, NSCoding {
    
    var name : String
    var age : Int
    var year : String
    var grade : Int
    var school : String
    var currentHomework : String?
    
    static let docDirectory =
        FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = docDirectory.appendingPathComponent("students")
    
    struct Keys {
        static let name = "name"
        static let age = "age"
        static let grade = "grade"
        static let year = "year"
        static let school = "school"
    }
    
    
    init(name : String, age : Int, year : String, grade : Int, school : String) {
        self.name = name
        self.age = age
        self.year = year
        self.grade = grade
        self.school = school
        
    }
        func setGrade(newGrade: Int) {
            self.grade = newGrade
        }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Keys.name)
        aCoder.encode(age, forKey: Keys.age)
        aCoder.encode(grade, forKey: Keys.grade)
        aCoder.encode(year, forKey: Keys.year)
        aCoder.encode(school, forKey: Keys.school)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let loadedName = aDecoder.decodeObject(forKey: Keys.name) as! String
        let loadedAge = aDecoder.decodeInteger(forKey: Keys.age)
        let loadedYear = aDecoder.decodeObject(forKey: Keys.year) as! String
        let loadedGrade = aDecoder.decodeInteger(forKey: Keys.grade)
        let loadedSchool = aDecoder.decodeObject(forKey: Keys.school) as! String
        
        
        self.init(name : loadedName, age : loadedAge, year : loadedYear, grade : loadedGrade, school : loadedSchool)
        self.age = loadedAge
        self.grade = loadedGrade
        self.year = loadedYear
        self.grade = loadedGrade
    }

    
}
