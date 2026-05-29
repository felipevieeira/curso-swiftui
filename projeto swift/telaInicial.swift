import SwiftUI

struct tabInicial: View {
    @Binding var saldo: Double
    var body: some View {
        NavigationStack {
            VStack{
                Spacer(minLength: 50)
                HStack {
                    // IMAGEM BAYA
                    Image("pecimoney")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        .frame(width: 250, height: 100)
                    Spacer()
                }
                // PLACEHOLDER DO GRAFICO
                Image("grafico")
                    .resizable()
                    .frame(height:200)
                    .offset(y:-20)

                
                ZStack {
                    // ZSTACK DO "MEUS INVESTIMENTOS"
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 375, height: 85)
                        .foregroundColor(.gray)
                    VStack{
                        Text("Meus investimentos")
                        Text(String(format: "$%.2f", saldo))
                            .font(.largeTitle)
                            .bold()
                    }
                }
                
                
                HStack {
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 170, height: 250)
                            .offset(x:-10)
                            .foregroundColor(.gray)
                        NavigationLink("Investir") {
                            investir(saldo: $saldo)
                        }
                        .bold()
                        .offset(x:-10)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 170, height: 250)
                            .offset(x:10)
                            .foregroundColor(.gray)
                        NavigationLink("Consultar"){
                            consultar()
                        }
                        .bold()
                        .offset(x:10)
                    }
                }
                
                //TAB
                ZStack{
                    UnevenRoundedRectangle(topLeadingRadius: 0,
                                           bottomLeadingRadius: 42,
                                           bottomTrailingRadius: 42,
                                           topTrailingRadius: 0,
                                           style: .continuous)
                    .offset(y:25)
                    .fill(.ultraThickMaterial)
                }
                .frame(height: 100)
            }
        }
        
    }
}



