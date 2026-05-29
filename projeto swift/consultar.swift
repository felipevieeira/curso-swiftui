import SwiftUI

struct consultar: View {
    @State private var preco: TwelveData?
    @State private var nome: String = ""
    @State private var perfil: TwelveDataProfile?
    
    var body: some View {
        VStack {
            TextField("Pesquisar: ", text: $nome)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 2)
                )
            
            if let perfil = perfil {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(height:200)
                        .foregroundColor(.white.opacity(0.2))
                    VStack(spacing: 12) {
                        Text(perfil.symbol)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text(perfil.name)
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                        if let preco {
                            Text("Preco: $\(preco.price)")
                        }
                        
                        
                    }
                    
                }
            }
        }
        .frame(width:300)
        
        .onChange(of: nome) { _, newValue in
            Task {
                do {
                    preco = try await TwelveDataAPI.fetchPrice(for: newValue)
                    perfil = try await TwelveDataAPI.fetchProfile(for: newValue)
                } catch {
                    print("Erro ao buscar o preço: \(error)")
                }
                
            }
        }
    }
}



