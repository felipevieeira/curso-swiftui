import SwiftUI

struct investir: View {
    @Binding public var saldo: Double
    
    @State private var preco: TwelveData?
    @State private var perfil: TwelveDataProfile?
    
    @State private var nome: String = ""
    
    @State private var quantidadeAcoes: Double = 0
    @State private var totalComprado: Double? = 0
    
    @State private var nomeAcaoComprada: String = ""
    @State private var precoAcaoAntigo: Double = 0
    @State private var variacao: Double = 0
    @State private var precoAcaoAtualVender: Double = 0
    
//    private var precoDouble: Double {
//        Double(preco?.price)
//    }

    
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
            
            Stepper("Quantidade: \(quantidadeAcoes)", value: $quantidadeAcoes, in: 1...100) { _ in
                totalComprado = quantidadeAcoes * (preco?.doublePrice ?? 0)
            }
            .padding()
            Text("Preco total: $ \(totalComprado ?? 0, format: .currency(code: "USD"))")
            
                .padding()
            Button("CONFIRMAR"){
                saldo = saldo - (totalComprado ?? 0)
                nomeAcaoComprada = nome
                precoAcaoAntigo = preco?.doublePrice ?? 0
//                    ContentView()
            }
            .background(RoundedRectangle(cornerRadius: 25)
                .frame(width: 200, height: 50)
                .foregroundColor(.green.opacity(0.3)))
            
            if let totalComprado, let perfil = perfil, let preco = preco {
                VStack {
                    Text("")
                    //                    Task {
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(height:200)
                            .foregroundColor(.white.opacity(0.2))
                        VStack(spacing: 12) {
                            
                            Text("Preco atual: $\(preco.doublePrice)")
                            
                            
                            Text("Preco no momento da compra: $\(precoAcaoAntigo)")
                            
                            Text("Variacao de preco: \(variacao)")
                            
                            Button("CONFIRMAR") {
                                saldo += variacao
                            }
                            
                        }
                        
                        //                    }
                    }
                }
                .background(RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200, height: 50)
                    .foregroundColor(.red.opacity(0.3)))
                .offset(y:-50)
                .task {
                    precoAcaoAtualVender = preco.doublePrice
                    variacao = quantidadeAcoes*precoAcaoAtualVender - totalComprado
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

