import SwiftUI

struct ContentView: View {
    @State private var path: [String] = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading, spacing: 16) {
                Button("程序化 push 一层") {
                    path.append("第二层")
                }

                NavigationLink("点我 push 第三层", value: "第三层")

                Text("当前 path 数量：\(path.count)")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .navigationTitle("NavigationStack")
            .navigationDestination(for: String.self) { level in
                VStack(spacing: 12) {
                    Text(level)
                        .font(.title2)
                    Button("继续 push") {
                        path.append("再下一层")
                    }
                }
                .padding()
            }
        }
    }
}
