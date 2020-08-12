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

struct AuteurDetailTableView: View {
  
  let selectedAuteur: Auteur!
  
  var body: some View {
    List {
      ForEach(selectedAuteur.films, id: \.title) { film in
        FilmRow(film: film)
          .listRowBackground(Color(red: 22.0/255.0, green: 22.0/255.0, blue: 22.0/255.0))
      }
    }
  }
}

struct FilmRow: View {
  
  let film: Film
  @State var isExpanded = false
  @State var moreInfo = "Tap For Details >"
  
  let moreInfoColor = Color.red
  let greyColor = Color(red: 0.75, green: 0.75, blue: 0.75, opacity: 1.0)
  
  var body: some View {
    
    VStack(alignment: .center) {
      Image(film.poster)
        .resizable()
        .padding(8)
        .aspectRatio(contentMode: .fit)
      Text(film.title)
        .padding(8)
        .foregroundColor(.white)
        .font(.system(size: 17))
      Text(moreInfo)
        .padding(8)
        .font(.system(size: 16))
        .foregroundColor(self.isExpanded ? greyColor : moreInfoColor)
    }.gesture(
      TapGesture()
        .onEnded { _ in
          (self.isExpanded == false) ? (self.moreInfo = self.film.plot) : (self.moreInfo = "Tap For Details >")
          self.isExpanded.toggle()
      }
    )
  }
}

struct AuteurDetailTableView_Previews: PreviewProvider {
  
  static var previews: some View {
    AuteurDetailTableView(selectedAuteur: Auteur.auteursFromBundle().first!)
  }
}
