@testable import BtechData
import BtechFoundation
import XCTest

final class ResponseHandlerTests: XCTestCase {
    func testResponseHandler() throws {
        // Given
        let sut = NetworkResponseHandler()

        let data = """
        {
            "attribute1": "test1",
            "attribute2": "test2"
        }
        """.data(using: .utf8)!

        let url = URL(string: "https://test.com")!
        let httpResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!

        // When
        let result: Result<SampleResponse, NetworkRequestError> =
            sut.handleResponse(urlResponse: httpResponse, data: data)

        // Then
        switch result {
        case let .success(decodedResponse):
            XCTAssertEqual(decodedResponse.attribute1, "test1")
            XCTAssertEqual(decodedResponse.attribute2, "test2")
        case let .failure(error):
            XCTFail("Expected successfully handling response, but received error:\n \(error)")
        }
    }
}

struct SampleResponse: Codable {
    let attribute1: String
    let attribute2: String
}
