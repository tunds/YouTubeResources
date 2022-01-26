//
//  ViewController.swift
//  Actor Isolation
//
//  Created by Tunde on 09/10/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("These are the same: \(Teacher.compare(teacher1, teacher2))")
        
        var teachers: [Teacher: [Subject]] = [:]

        teachers[teacher1] = [
            Subject(title: "Maths"),
            Subject(title: "English")
        ]

        teachers[teacher2] = [
            Subject(title: "P.E"),
            Subject(title: "Geography")
        ]
      
        let teacher1Subjects = teachers[teacher1]?
            .compactMap { $0.title }
            .joined(separator: ",")
        
        if let subjects = teacher1Subjects {
            print("Teacher 1 teaches: \(subjects)")
        }
                
    }
}

