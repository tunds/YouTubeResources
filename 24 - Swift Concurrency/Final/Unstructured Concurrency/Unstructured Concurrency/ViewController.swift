//
//  ViewController.swift
//  Unstructured Concurrency
//
//  Created by Tunde on 20/09/2021.
//

import UIKit

struct PhotoService {
    
    enum ContentError: Error {
        case invalidRequest
        case failedToDecode
        case custom(error: Error)
    }
    
    func download(_ url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw ContentError.invalidRequest
              }
        return data
    }
    
    func cache(image: UIImage) {
        print("Simulating caching \(image) on Main Thread: \(Thread.isMainThread)")
    }
    
    func log(url: URL) {
        print("Logging url \(url.absoluteString) on Main Thread: \(Thread.isMainThread)")
    }
}

class ViewController: UIViewController {

    private let vm = ImagesViewModel()
    private let service = PhotoService()
    
    private var photoTasks: [IndexPath: Task<Void, Never>] = [:]

    private let tv: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.cellId)
        return tv
    }()
    
    override func loadView() {
        super.loadView()
        setup()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.cellId,
                                                 for: indexPath) as? PhotoTableViewCell
        return cell!
    }
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        // Handle task
        if let url = URL(string: vm.content[indexPath.row]) {
            photoTasks[indexPath] = Task {

                do {
                
                    if let cell = tableView.cellForRow(at: indexPath) as? PhotoTableViewCell,
                       let image = UIImage(data: try await service.download(url)) {
                        cell.imgVw.image = image
                        let backgroundTasks = Task.detached(priority: .background) {
                            
                            await withTaskGroup(of: Void.self) { g in
                                g.addTask { self.service.cache(image: image) }
                                g.addTask { self.service.log(url: url) }
                            }
                        }
                    }
                    
                } catch {
                    print(error)
                }

                self.photoTasks[indexPath] = nil
            }
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didEndDisplaying cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        
        photoTasks[indexPath]?.cancel()
    }
}

private extension ViewController {
    
    func setup() {
        
        tv.dataSource = self
        tv.delegate = self
        
        self.view.addSubview(tv)
        
        NSLayoutConstraint.activate([
            tv.topAnchor.constraint(equalTo: view.topAnchor),
            tv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tv.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
