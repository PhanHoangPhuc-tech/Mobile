import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Image("logo") // Đổi thành hình của bạn
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190, height: 190)
                    .padding(.top, 30) // Điều chỉnh khoảng cách phía trên
                    .padding(.bottom, 20)

                Text("Jetpack Compose")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                Text("Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    
                
                Spacer() // Đẩy nút xuống đáy màn hình

                NavigationLink("I'm ready", destination: UIComponentsListView())
                    .padding()
                    .frame(maxWidth: .infinity) // Chiều rộng đầy đủ
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule()) // Bo tròn góc
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30) // Tạo khoảng cách với mép dưới
            }
            .frame(maxHeight: .infinity) // Đảm bảo VStack chiếm toàn bộ màn hình
            .background(Color.white) // Đặt nền trắng

            #if os (iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
        }
    }
}

struct UIComponentsListView: View {

    var body: some View {
        List {
            Section(header: Text("Display")) {
                NavigationLink("Text", destination: TextDetailView())
                NavigationLink("Image", destination: ImageDetailView())
            }
            Section(header: Text("Input")) {
                NavigationLink("TextField", destination: TextFieldDetailView())
                NavigationLink("PasswordField", destination: PasswordFieldDetailView())
            }
            Section(header: Text("Layout")) {
                NavigationLink("Column", destination: ColumnDetailView())
                NavigationLink("Row", destination: RowDetailView())
            }
        }
        .navigationTitle("UI Components")
        #if os (iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

// Màn hình chi tiết cho Text
struct TextDetailView: View {
    @State private var text = ""
    var body: some View {
        VStack {
            TextField("Enter some text", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top,-350)
          
        }
        .navigationTitle("Text Detail")
        #if os (iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

// Màn hình chi tiết cho Image
struct ImageDetailView: View {
    var body: some View {
        VStack {
            
            Image(systemName: "photo.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
        }
        .navigationTitle("Image Detail")
        #if os (iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

// Màn hình chi tiết cho TextField
struct TextFieldDetailView: View {
    @State private var text = ""

    var body: some View {
        VStack {
            TextField("Enter some text", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top,-350)
        }
        .navigationTitle("TextField Detail")
        #if os (iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

// Màn hình chi tiết cho PasswordField
struct PasswordFieldDetailView: View {
    @State private var password = ""

    var body: some View {
        VStack {
            SecureField("Enter password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top,-350)
        }
        .navigationTitle("PasswordField Detail")
        #if os (iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

// Màn hình chi tiết cho Column
struct ColumnDetailView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
            .padding(.top,-350)
        }
        .navigationTitle("Column Detail")
        #if os (iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

// Màn hình chi tiết cho Row
struct RowDetailView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
            .padding(.top,-350)
        }
        .navigationTitle("Row Detail")
        #if os (iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
