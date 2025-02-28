import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Avatar
            Image("Nobita")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)

            // Tên người dùng
            Text("Nobita")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            // Địa chỉ
            Text("Tokyo, Japan")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
