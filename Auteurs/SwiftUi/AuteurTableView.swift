/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct AuteurTableView: View {
  
  let auteurs: [Auteur]
  
  var body: some View {
    NavigationView {
      List {
        ForEach(auteurs, id: \.name) { auteur in
          NavigationLink(destination: AuteurDetailTableView(selectedAuteur: auteur)) {
            AuteurRow(autuer: auteur)
          }
            .listRowBackground(Color(red: 22.0/255.0, green: 22.0/255.0, blue: 22.0/255.0))
        }
      }.navigationBarTitle("Auteurs")
    }
  }
}

struct AuteurRow: View {
  
  let autuer: Auteur
  
  var body: some View {
    VStack {
      VStack (alignment: .center) {
        Image(autuer.image)
          .cornerRadius(200)
          .padding(.bottom, 8)
        Text(autuer.name)
          .padding(.top, 8)
          .padding(.bottom, 8)
          .padding(.leading, 8)
          .font(.system(size: 18))
          .foregroundColor(.white)
      }
      VStack (alignment: .leading) {
        Text(autuer.bio)
          .padding(.top, 8)
          .font(.system(size: 17))
          .foregroundColor(Color(red: 0.75, green: 0.75, blue: 0.75))
        Text(autuer.source)
          .italic()
          .padding(.top, 8)
          .padding(.bottom, 16)
          .font(.system(size: 13))
          .alignmentGuide(.leading, computeValue: { _ in -8})
          .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
      }
    }
  }
}

struct AuteurTableView_Previews: PreviewProvider {
  static var previews: some View {
    AuteurTableView(auteurs: Auteur.auteursFromBundle())
  }
}
