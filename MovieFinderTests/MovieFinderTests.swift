//
//  MovieFinderTests.swift
//  MovieFinderTests
//
//  Created by Zankhna Gohil on 14/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import XCTest
@testable import MovieFinder

class MovieFinderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
 
    func testGenerText() {
        
        let genreManager = GenreManager.sharedInstance
        let g1 = Genre(JSON: ["id": 1,"name":"Action"])
        genreManager.genre = [g1!];
        
        let genreString = genreManager.getGenreStringFromGenreIDs(arrayOfGenerIds: [1])
        XCTAssert(genreString == "Action")
        
        let nilGereString = genreManager.getGenreStringFromGenreIDs(arrayOfGenerIds: nil)
        XCTAssert(nilGereString == "", "For nil Array in genre id Array")
        
        let emptryArrayGereString = genreManager.getGenreStringFromGenreIDs(arrayOfGenerIds: [])
        XCTAssert(emptryArrayGereString == "", "For Empty Array in genre id Array")
        
    }
    
    func testDisplayType () {
        
        class DisplayViewController:MovieListViewController {
            var isFetcheCalled:Bool = false
            
             override func fetchMovies() {
                self.isFetcheCalled = true
            }
        }
        
        let movieList = DisplayViewController()
        let segmentControl = UISegmentedControl()
        segmentControl.selectedSegmentIndex = 1
        movieList.segmentControlClickAction(segmentControl)
        
        XCTAssert(movieList.isFetcheCalled, "Is fetched call on segment change")
        XCTAssert(movieList.dataSourceArray.count == 0, "Flush datasource array when display type is changed")
        XCTAssert(movieList.page == 0, "Make page no. to 0")
        
    }
    
}
