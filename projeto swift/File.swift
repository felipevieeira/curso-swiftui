import SwiftUI

struct investir1: View {
    @State private var preco: TwelveData?
    @State private var perfil: TwelveDataProfile?
    @State private var nome: String = ""
    
    @Binding public var saldo: Float
    
    // Estados para controle do formulário de Compra
    @State private var quantidadeAcoes: Int = 1 // Stepper funciona melhor com Int
    
    // Estados persistentes para guardar os dados da compra realizada
    @State private var acaoComprada: Bool = false
    @State private var nomeAcaoComprada: String = ""
    @State private var precoAcaoAntigo: Float = 0.0
    @State private var quantidadeComprada: Float = 0.0
    @State private var custoTotalCompra: Float = 0.0

    // Variável de ambiente nativa para voltar para a tela anterior
    @Environment(\.dismiss) var dismiss
    
    // Variáveis Computadas (Cálculos automáticos em tempo real seguros)
    private var precoFloat: Float {
        Float(preco?.price ?? "0.0") ?? 0.0
    }
    
    private var totalComprado: Float {
        Float(quantidadeAcoes) * precoFloat
    }
    
    private var variacao: Float {
        let valorAtualizado = quantidadeComprada * precoFloat
        return valorAtualizado - custoTotalCompra
    }

    var body: some View {
        VStack(spacing: 20) {
            // Campo de pesquisa (Bloqueado caso ele já tenha comprado e esteja na tela de venda)
            if !acaoComprada {
                TextField("Pesquisar Código da Ação: ", text: $nome)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.characters)
            }
            
            // Renderização do cartão de informações da Empresa
            if let perfil = perfil {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(height: 180)
                        .foregroundColor(.white.opacity(0.15))
                    
                    VStack(spacing: 10) {
                        Text(perfil.symbol)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text(perfil.name)
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                        
                        if preco != nil {
                            Text("Preço Unitário: $\(precoFloat, specifier: "%.2f")")
                                .font(.title3)
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                }
            }
            
            // --- FLUXO 1: SE AINDA NÃO COMPROU (MOSTRA INTERFACE DE COMPRA) ---
            if !acaoComprada {
                if perfil != nil {
                    Stepper("Quantidade: \(quantidadeAcoes)", value: $quantidadeAcoes, in: 1...100)
                        .padding(.horizontal)
                    
                    Text("Preço total: $\(totalComprado, specifier: "%.2f")")
                        .font(.headline)
                    
                    Button(action: {
                        if saldo >= totalComprado {
                            // Executa a lógica financeira de compra
                            saldo -= totalComprado
                            
                            // Guarda o estado de como a ação foi comprada
                            nomeAcaoComprada = nome
                            precoAcaoAntigo = precoFloat
                            quantidadeComprada = Float(quantidadeAcoes)
                            custoTotalCompra = totalComprado
                            
                            // Ativa a tela de venda
                            acaoComprada = true
                        }
                    }) {
                        Text("CONFIRMAR COMPRA")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50)
                            .background(Color.green)
                            .cornerRadius(25)
                    }
                    .disabled(saldo < totalComprado) // Desabilita se o usuário não tiver dinheiro
                }
                
            // --- FLUXO 2: SE JÁ COMPROU (MOSTRA INTERFACE DE DETALHES E VENDA) ---
            } else {
                VStack(spacing: 15) {
                    Divider().background(Color.white)
                    
                    Text("Minha Posição")
                        .font(.title2)
                        .bold()
                    
                    Text("Preço na Compra: $\(precoAcaoAntigo, specifier: "%.2f")")
                    Text("Quantidade Guardada: \(quantidadeComprada, specifier: "%.0f")")
                    Text("Investimento Inicial: $\(custoTotalCompra, specifier: "%.2f")")
                    
                    HStack {
                        Text("Variação Atual:")
                        Text(String(format: "$%.2f", variacao))
                            .bold()
                            .foregroundColor(variacao >= 0 ? .green : .red)
                    }
                    .font(.headline)
                    
                    Button(action: {
                        // Devolve o dinheiro investido + ou - a variação de mercado
                        saldo += (custoTotalCompra + variacao)
                        
                        // Reseta o estado do simulador de investimentos
                        acaoComprada = false
                        nome = ""
                        perfil = nil
                        preco = nil
                        quantidadeAcoes = 1
                        
                        // Retorna o usuário de forma limpa para a TabView principal
                        dismiss()
                    }) {
                        Text("VENDER AÇÕES")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50)
                            .background(Color.red)
                            .cornerRadius(25)
                    }
                }
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(20)
            }
        }
        .frame(width: 320)
        .padding()
        // O .onChange monitora o campo e atualiza o preço de forma dinâmica, servindo para compra e venda
        .onChange(of: nome) { _, newValue in
            guard !newValue.isEmpty else { return }
            Task {
                do {
                    preco = try await TwelveDataAPI.fetchPrice(for: newValue)
                    perfil = try await TwelveDataAPI.fetchProfile(for: newValue)
                } catch {
                    print("Erro ao buscar a ação: \(error)")
                }
            }
        }
    }
}
