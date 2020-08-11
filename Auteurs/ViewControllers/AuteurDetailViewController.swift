/// Copyright (c) 2018 Razeware LLC
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
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class AuteurDetailViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var selectedAuteur: Auteur!
  let moreInfoText = "Tap For Details >"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = selectedAuteur.name
    self.tableView.contentInsetAdjustmentBehavior = .never
    
    // Let the table view estimate the row height.
    // The estimated row height is still needed to be declared in order for the tableview to know what size to start with.
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 300
  }
}

extension AuteurDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedAuteur.films.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                   for: indexPath) as? AuteurDetailTableViewCell else {
                                                    fatalError("Unable to Dequeue Cell.")
    }
    
    let film = selectedAuteur.films[indexPath.row]
    
    cell.filmImageView.image = UIImage(named: film.poster)
    
    cell.filmTitleLabel.text = film.title
    cell.filmTitleLabel.textColor = .white
    cell.filmTitleLabel.textAlignment = .center
    
    cell.moreInfotextView.text = film.isExpanded ? film.plot : moreInfoText
    cell.moreInfotextView.textAlignment = film.isExpanded ? .left : .center
    cell.moreInfotextView.textColor = film.isExpanded ? UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0) : .red
    
    cell.selectionStyle = .none
    
    return cell
  }
}

extension AuteurDetailViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    // 1
    guard let cell = tableView.cellForRow(at: indexPath) as? AuteurDetailTableViewCell else { return }
    
    // 2
    var film = selectedAuteur.films[indexPath.row]
    film.isExpanded = !film.isExpanded
    
    // 3
    cell.moreInfotextView.text = film.isExpanded ? film.plot : moreInfoText
    cell.moreInfotextView.textAlignment = film.isExpanded ? .left : .center
    cell.moreInfotextView.textColor = film.isExpanded ? UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0) : .red
    
    // 4
    tableView.beginUpdates()
    tableView.endUpdates()
    
    // 5
    tableView.scrollToRow(at: indexPath, at: .top, animated: true)
  }
}

