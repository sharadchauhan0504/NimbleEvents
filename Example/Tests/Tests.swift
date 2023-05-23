import XCTest
import NimbleEvents

class Tests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    func testAddEventToSystem() {
        let swiftPublicMethods = SwiftPublicMethods()
        let success = swiftPublicMethods.addEventToSystem(map: ["key1": "2", "key2": "3"])
        XCTAssertTrue(success)
    }

    func testGetAggregatedAnswer() {
        let swiftPublicMethods = SwiftPublicMethods()
        let success = swiftPublicMethods.addEventToSystem(map: ["key1": "2", "key2": "3"])
        sleep(5)
        _ = swiftPublicMethods.addEventToSystem(map: ["key1": "1", "key2": "3"])
        sleep(10)
        _ = swiftPublicMethods.addEventToSystem(map: ["key1": "3", "key2": "3"])
        XCTAssertTrue(success)
        
        let values = swiftPublicMethods.getAggregatedAnswer(key: "key1")
        XCTAssertEqual(values, [3.0, 6.0])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
