//
//  HomeView.swift
//  Trailers
//
//  Created by Pedro Thomas on 1/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = MovieViewModel()
    
    var body: some View {
        VStack {
            Text("Hello World")
        }
        .onAppear {
            vm.loadTrendingMovies()
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
