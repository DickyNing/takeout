import SwiftUI
import SwiftData


struct categoriesView: View {
    var body: some View {
        NavigationView{
            Text("Different categories of food!")
                .padding()
                .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        categoriesView()
    }
}

