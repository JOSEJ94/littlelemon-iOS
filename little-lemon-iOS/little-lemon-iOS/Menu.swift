import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText: String = ""
    
    private func createSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    private func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // Header
            VStack(spacing: 8) {
                Text("Little Lemon")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Chicago")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal)
            }
            .padding()
            .background(Color(.red))
            .cornerRadius(10)
            .padding(.horizontal)
            
            // Search Field
            TextField("Search menu", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .shadow(radius: 1)
                .padding(.horizontal)
            
            // Dishes List
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: createSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id: \.title) { dish in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(dish.title ?? "Unknown")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text("$\(dish.price!)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .cornerRadius(8)
                            } placeholder: {
                                Color.gray
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .background(Color(.systemGroupedBackground))
        .onAppear {
            MenuList.getMenuData(viewContext)
        }
    }
}

#Preview {
    Menu()
}
