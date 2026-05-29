import SwiftUI

struct tabPerfil: View {
    @Binding public var saldo: Double
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ZStack {
                    UnevenRoundedRectangle(topLeadingRadius: 42,
                                           bottomLeadingRadius: 0,
                                           bottomTrailingRadius: 0,
                                           topTrailingRadius: 42,
                                           style: .continuous)
                    .fill(Color(red: 0.1, green: 0.1, blue: 0.4))
                    .frame(height:200)
                    .offset(y:-70)
                    HStack{
                        Image("baya")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                            .frame(width: 100, height: 100)
                            .offset(x:25, y: -70)
                        Text("Guilherme Baya")
                            .bold()
                            .offset(x:40, y: -80)
                        Text("542.587.049-12")
                            .bold()
                            .offset(x:-90, y:-50)
                        
                        
                        Spacer()
                        
                    }
                    Spacer()
                }
                Text("   Dados da conta")
                    .bold()
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.indigo)
                        .frame(width: 370, height: 150)
                    VStack(alignment: .leading) {
                        Text("Conta Digital")
                            .font(.title)
                            .bold()
                        Text("")
                        Text("239 - Banco PeciMoney SA")
                        Text("Agência 0001")
                        Text("Conta: 1928726-7")
                    }
                    .padding()
                }
                
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.indigo)
                        .frame(width: 370, height: 100)
                    
                    VStack(alignment: .leading) {
                        Text("Saldo")
                            .font(.title)
                            .bold()
                        
                        Text(String(format: "$%.2f", saldo))
                            .font(.title)
                    }
                    .padding()
                }
                
                UnevenRoundedRectangle(topLeadingRadius: 0,
                                       bottomLeadingRadius: 42,
                                       bottomTrailingRadius: 42,
                                       topTrailingRadius: 0,
                                       style: .continuous)          .fill(.ultraThickMaterial)
                    .offset(y:175)
            }
        }
        
    }
}
