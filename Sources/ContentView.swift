
import SwiftUI
import Network

struct ServerInfo: Identifiable {
    let id = UUID()
    let address: String
    let port: String
    let hostname: String
    let gamemode: String
    let players: Int
    let maxPlayers: Int
}

struct ContentView: View {
    @State private var address = ""
    @State private var port = "7777"
    @State private var hostname = ""
    @State private var status = "Masukkan IP server."
    @State private var querying = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Server SA-MP / open.mp") {
                    TextField("IP server (IPv4)", text: $address)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()

                    TextField("Port", text: $port)
                        .keyboardType(.numberPad)

                    Button("Query Server") {
                        queryServer()
                    }
                    .disabled(querying || address.isEmpty || port.isEmpty)
                }

                Section("Informasi Server") {
                    Text(status)
                    if !hostname.isEmpty {
                        Text("Nama: \(hostname)")
                    }
                }

                Section("Tahap Pengembangan") {
                    Text("Versi awal: antarmuka server browser.")
                    Text("Gameplay, login pemain, chat dan sinkronisasi belum tersedia.")
                }
            }
            .navigationTitle("SA-MP iOS")
        }
    }

    private func queryServer() {
        // Placeholder: implementasi protokol UDP
        // akan ditambahkan setelah fondasi proyek disiapkan.
        status = "Server browser siap dikembangkan."
        hostname = ""
        querying = false
    }
}
