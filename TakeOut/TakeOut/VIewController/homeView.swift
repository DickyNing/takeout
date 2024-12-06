import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("dining-area-3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipped()
                    .padding(.top, 50)
                    .navigationTitle("Dining Places")
               
                                }
        }
        .navigationViewStyle(.stack)
    }
}

struct CustomContainerView: UIViewRepresentable {
    @Binding var data: [MenuItemData]

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        // Example of adding dynamic content based on data
        for (index, item) in data.enumerated() {
            let label = UILabel()
            label.text = "\(item.name): \(item.description) - $\(item.price)"
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(20 + (index * 40)))
            ])
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the view if needed
    }
}

struct MenuItemData: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var price: Double
}

struct CombinedPreviews: View {
    @State private var data: [MenuItemData] = []

    var body: some View {
        VStack {
            HomeView()
            CustomContainerView(data: $data)
                .frame(height: 400)
                .padding()
                .onAppear {
                    fetchData()
                }
        }
    }
    
    func fetchData() {
        // Fetch data from the backend
        guard let url = URL(string: "http://localhost:8000/get_data") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode([MenuItemData].self, from: data) {
                    DispatchQueue.main.async {
                        self.data = decodedData
                    }
                }
            }
        }.resume()
    }
}

struct CombinedPreviews_Previews: PreviewProvider {
    static var previews: some View {
        CombinedPreviews()
    }
}
