import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var result: String = ""

    var body: some View {
        VStack(spacing: 16) {
            Text("Kiểm tra độ tuổi")
                .font(.largeTitle)

            TextField("Họ và tên", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            
            TextField("Tuổi", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        
                .padding()


            Button(action: {
                if let ageInt = Int(age) {
                    if ageInt > 65 {
                        result = "\(name) là Người già (>65)"
                    } else if ageInt >= 6 {
                        result = "\(name) là Người lớn (6-65)"
                    } else if ageInt >= 2 {
                        result = "\(name) là Trẻ em (2-6)"
                    } else {
                        result = "\(name) là Em bé (<2)"
                    }
                } else {
                    result = "Vui lòng nhập số hợp lệ!"
                }
            }) {
                Text("Kiểm tra")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Text(result)
                .font(.title)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

