//
//  Aula 02.swift
//  Aula01
//
//  Created by Aluno Mack on 19/05/26.
//
/*
import SwiftUI

struct Aula02: View {
    @State var numero = 0
    var body: some View {
        NomeView(numero: $numero)
    }
}

struct NomeView: View {
    
    @Binding var numero: Int
    var body: some View {
        
        VStack {
            Text(numero.formatted())
                .font(.largeTitle)
                .padding()
            
            ZStack {
                Button("Incrementar numero"){
                    numero += 1
                }
                .tint(.black)
                
                .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 200, height: 50)
                    .foregroundColor(.indigo))
                
                
                
            }
            
        }
    }
}





struct Aula01: View {
    var body: some View {
        
        ZStack {
            Rounded
 tangle(cornerRadius: 25.0)
                .foregroundStyle(.linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom))
                .frame(width: 250, height: 250)
            HStack {
                VStack {
                    Rectangle()
                        .frame(width:90, height:90)
                        .foregroundColor(.yellow)
                        .padding()
                    Circle()
                        .frame(width:80)
                        .foregroundColor(.blue)
                }
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 75,height: 200)
                    .foregroundColor(.green)
            }
        }
    }
}




struct Aula02dois: View {
    var body: some View {
        VStack {
            Image("ruga")
                .resizable()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width:200, height: 200)
            
            
            Text("RUGA")
                .font(.largeTitle)
                .bold()
                .padding()
            Text("Pedro Rugai é um estudante do Mackenzie que ta cursando economia. Fez o ensino medio no Colegio Rainha da Paz.")
                .padding()
                .padding()
            
            
        }
    }
}


struct Aula04: View {
    @State private var user: GitHubUser?
    @State private var username: String = ""
    
    var body: some View {
        VStack{
            TextField("Username", text: $username)
            
            if let user {
                AsyncImage(url: URL(string: user.avatarUrl))
            }
        }
        .task {
            try? await user = GitHubAPI.fetchUser(username: username)
        }
        .onChange(of: username) {_, newValue in
            Task {
                try? await user = GitHubAPI.fetchUser(username: newValue)
            }
        }
    }
}

struct Aula04dois: View {
    @State private var dog: Dog?
    
    var body: some View {
        VStack {
            if let dog {
                AsyncImage(url: URL(string:dog.message)) { img in
                    img
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .frame(width: 375, height: 400)
                    
                } placeholder: {
                    ProgressView()
                }
            
            }
            ZStack{
                
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(.teal)
                    .frame(width:150, height: 50)
                    .padding()
                    .padding()
                Button("Gerar cachorro"){
                    
                    Task{
                        try? await dog = DogAPI.fetchUser()
                        
                    }
                
                }
            }
            .tint(.white)
        }
    }
}
#Preview{
    Aula04dois()
}
*/
