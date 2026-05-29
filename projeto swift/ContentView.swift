import SwiftUI


struct ContentView: View {
    @State public var saldo: Double = 10000000

    var body: some View {
        TabView {
            tabInicial(saldo: $saldo)
                .tabItem{
                    Label("Tela inicial", systemImage: "dollarsign.square.fill")
                }
            tabPerfil(saldo: $saldo)
                .tabItem{
                    Label("Perfil", systemImage: "person")
                }
        }
    }
}



#Preview {
    ContentView()
}
