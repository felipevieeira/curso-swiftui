
/*import SwiftUI

struct TabViewView2: View {
    var body: some View {
        TabView {
            NavigationStack {
                List() {
                    NavigationLink("Aula 1") {
                        Aula01()
                    }
                    NavigationLink("Aula 2 - parte 1") {
                        Aula02()
                    }
                    NavigationLink("Aula 2 - parte 2") {
                        Aula02dois()
                    }
                    NavigationLink("Aula 4 - parte 1") {
                        Aula04()
                    }
                    NavigationLink("Aula 4 - parte 2") {
                        Aula04dois()
                    }
                    
                    
                    
                    NavigationLink("TESTE") {
                        VStack{
                            HStack{
                                Image("ruga")
                                    .resizable()
                                    .frame(width: 200, height: 300)
                                
                                
                                Image("ricardo")
                                    .resizable()
                                    .frame(width: 200, height: 300)

                            }
                            HStack{
                                Image("dudu")
                                    .resizable()
                                    .frame(width: 200, height: 300)
                                Image("baya")
                                    .resizable()
                                    .frame(width: 200, height: 300)
                                    
                                
                            }
                        }
                    }
                }
                .navigationTitle("Aulas")
            }
            
            .tabItem{
                Label("AULAS", systemImage:"book.fill")
            }
            
            NavigationStack {
                VStack{
                    Text("Pedro Rugai")
                        .padding()
                    Image("ruga")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                .padding()
                VStack{
                    NavigationLink {
                        Text("Oi sou o Pedro Rugai")
                    } label: {
                        Text("Ver sobre")
                    }
                }
            }
                    .tabItem{
                        Label("Rugai", systemImage: "person.3.fill")
                    }
            NavigationStack {
                VStack{
                    Text("Ricardo")
                    Image("ricardo")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                    NavigationLink {
                        Text("Oi sou o Ricardo")
                    } label: {
                        Text("Ver sobre")
                    }
                }
            }
                    .tabItem {
                        Label("Ricardo", systemImage: "ear")
                    }
            }
        }
    }
    
#Preview {
    TabViewView2()
    }
    
*/
