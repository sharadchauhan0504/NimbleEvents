import XCTest
import NimbleEvents

class Tests: XCTestCase {
    
    var swiftPublicMethods: SwiftPublicMethods!
    
    override func setUp() {
        super.setUp()
        swiftPublicMethods = SwiftPublicMethods()
    }
    
    func testAddEventToSystem() {
        let success = swiftPublicMethods.addEventToSystem(map: ["key1": "2", "key2": "3"])
        XCTAssertTrue(success)
    }
    
    func testGetAggregatedAnswer() {
        let values = swiftPublicMethods.getAggregatedAnswer(key: "key1")
        XCTAssertEqual(values, [1, 1])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        swiftPublicMethods = nil
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
