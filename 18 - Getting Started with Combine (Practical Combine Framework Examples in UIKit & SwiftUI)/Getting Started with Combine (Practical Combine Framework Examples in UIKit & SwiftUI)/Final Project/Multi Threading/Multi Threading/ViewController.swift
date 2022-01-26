//
//  ViewController.swift
//  Multi Threading
//
//  Created by Tunde on 13/04/2021.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private let contentImgVw: UIImageView = {
        let imgVw = UIImageView()
        imgVw.clipsToBounds = true
        imgVw.translatesAutoresizingMaskIntoConstraints = false
        imgVw.contentMode = .scaleAspectFill
        imgVw.backgroundColor = .systemGray4
        imgVw.layer.cornerRadius = 8
        return imgVw
    }()
    
    private let downloadBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(downloadDidTouch), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.setTitle("Download", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return btn
    }()
    
    private let contentContainerStackVw: UIStackView = {
        let stackVw = UIStackView()
        stackVw.spacing = 16
        stackVw.axis = .vertical
        stackVw.distribution = .fillProportionally
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        return stackVw
    }()
    
    private let imgLink = "https://blueprint-api-production.s3.amazonaws.com/uploads/story/thumbnail/121489/11a49146-03e6-4f02-8c30-ac3454a1b54b.png"
    
    private let imgDownloaderViewModel = ImageDownloaderViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        setup()
        setupImageSubscription()
    }
    
    @objc
    func downloadDidTouch() {
        imgDownloaderViewModel.download(url: imgLink)
    }
}

private extension ViewController {
    
    func setup() {
        
        contentContainerStackVw.addArrangedSubview(contentImgVw)
        contentContainerStackVw.addArrangedSubview(downloadBtn)
        
        view.addSubview(contentContainerStackVw)
        
        NSLayoutConstraint.activate([
            
            downloadBtn.heightAnchor.constraint(equalToConstant: 44),
            contentImgVw.heightAnchor.constraint(equalToConstant: 150),
            
            contentContainerStackVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentContainerStackVw.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentContainerStackVw.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                             constant: 16),
            contentContainerStackVw.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                              constant: -16)

        ])
    }
    
    func setupImageSubscription() {
        
        imgDownloaderViewModel
            .image
            .assign(to: \.image, on: contentImgVw)
            .store(in: &subscriptions)
    }
}

class ImageDownloaderViewModel {
    
    let image = PassthroughSubject<UIImage?, Never>()
    
    private var subscriptions = Set<AnyCancellable>()

    func download(url: String) {
        
        URLSession
            .shared
            .dataTaskPublisher(for: URL(string: url)!)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .handleEvents(receiveSubscription: { _ in
                
                print("Starting Subscription on the main thread: \(Thread.isMainThread)")
                
                DispatchQueue.main.async {
                    print("Setting the placeholder image on the main thread: \(Thread.isMainThread)")
                    self.image.send(UIImage(named: "placeholder"))
                }
            })
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { (res) in
                switch res {
                case .failure:
                    print("Failed on the main thread: \(Thread.isMainThread)")
                case .finished:
                    print("Finished on the main thread: \(Thread.isMainThread)")
                }
            } receiveValue: { [weak self] (val) in
                self?.image.send(val)
                self?.image.send(completion: .finished)
                print("Recieved Value on the main thread: \(Thread.isMainThread)")
            }
            .store(in: &subscriptions)
    }
}
