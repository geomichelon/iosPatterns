import SwiftUI

struct RequestPreviewView: View {
    // The built request to preview.
    let request: NetworkRequest

    var body: some View {
        // Show a read-only summary of the built request.
        VStack(alignment: .leading, spacing: 8) {
            Text("Builder")
                .font(.title2)
            Text("Method: \(request.method.rawValue)")
            Text("Path: \(request.path)")
            Text("Headers: \(request.headers.count)")
            Text("Body: \(request.body != nil ? "Yes" : "No")")
        }
        .padding()
    }
}
