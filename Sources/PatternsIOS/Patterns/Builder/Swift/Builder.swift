import Foundation

// Example request model assembled by the builder.
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

// Immutable request built by RequestBuilder.
struct NetworkRequest {
    let method: HTTPMethod
    let path: String
    let headers: [String: String]
    let body: Data?
}

// Builder that collects configuration step by step.
final class RequestBuilder {
    private var method: HTTPMethod = .get
    private var path: String = "/"
    private var headers: [String: String] = [:]
    private var body: Data?

    @discardableResult
    func setMethod(_ method: HTTPMethod) -> RequestBuilder {
        self.method = method
        return self
    }

    @discardableResult
    func setPath(_ path: String) -> RequestBuilder {
        self.path = path
        return self
    }

    @discardableResult
    func addHeader(name: String, value: String) -> RequestBuilder {
        headers[name] = value
        return self
    }

    @discardableResult
    func setBody(_ body: Data?) -> RequestBuilder {
        self.body = body
        return self
    }

    // Finalize and return the immutable request.
    func build() -> NetworkRequest {
        NetworkRequest(method: method, path: path, headers: headers, body: body)
    }
}
