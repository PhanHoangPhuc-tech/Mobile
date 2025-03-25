import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            RootView()
        }
    }
}

struct RootView: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 350, height: 350)
            
            Text("Navigation")
                .font(.title)
                .padding()
            
            Text("is a framework that simplifies the implementation of navigation between different UI components (activities, fragments, or composables) in an app")
                           .font(.body)
                           .multilineTextAlignment(.center)
                           .padding(.horizontal, 30)
                           .padding(.top, 10)
                
            Spacer()
            
            NavigationLink(destination: ListView()) {
                Text("PUSH")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct ListView: View {
    let items = (1...1_000_000).map { "\($0) The only way to do great work is to love what you do." }
    
    var body: some View {
        List(items, id: \.self) { item in
            NavigationLink(destination: DetailView(text: item)) {
                Text(item)
                    .padding()
            }
        }
        .navigationTitle("LazyColumn")
    }
}

struct DetailView: View {
    let text: String
    
    var body: some View {
        VStack {
            
            Text(text)
                .font(.title)
                .padding()
            
            Spacer()
            
         
            NavigationLink(destination: RootView()) {
                Text("BACK TO ROOT")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Detail")
    }
}
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

