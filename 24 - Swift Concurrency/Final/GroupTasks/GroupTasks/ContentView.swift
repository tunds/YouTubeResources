//
//  ContentView.swift
//  GroupTasks
//
//  Created by Tunde on 12/09/2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var images = [Picture]()
    
    var body: some View {
        
        List {
            ForEach(images) { photo in
                VStack(alignment: .center) {
                    Image(uiImage: photo.image)
                    Text(photo.author)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .task {
            
            do {
                let service = PhotoService()
                let results = try await service.fetchPhotos()
                self.images = results
                dump(results)
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Photo: Codable {
    let id: String
    let author: String
    let width: Double
    let height: Double
    let url: String
    let downloadUrl: String
}

struct Picture: Identifiable {
    let id = UUID()
    let image: UIImage
    let author: String
}

struct PhotoService {
    
    enum ContentError: Error {
        case invalidRequest
        case failedToDecode
        case custom(error: Error)
    }
    
    private func fetch<T: Codable>(_ url: URL,
                           type: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw ContentError.invalidRequest
              }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
    
    private func download(_ url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw ContentError.invalidRequest
              }
        return data
    }
    
    private func retrievePhotosList() async throws -> [Photo] {
        return try await fetch(URL(string: "https://picsum.photos/v2/list?limit=5")!, type: [Photo].self)
    }
    
    private func fetchPhotoThumbnail(from photo: Photo) async throws -> UIImage {
        async let photoMetaInfo = fetch(URL(string: "https://picsum.photos/id/\(photo.id)/info")!, type: Photo.self)
        async let data = download(URL(string: photo.downloadUrl)!)
        
        let size = parseSize(from: try await photoMetaInfo)
        
        guard let image = try await UIImage(data: data)?.byPreparingThumbnail(ofSize: size) else { throw ContentError.failedToDecode }
        
        return image
    }
    
    private func parseSize(from photo: Photo) -> CGSize {
        return .init(width: 200, height: 150)
    }
    
    func fetchPhotos() async throws -> [Picture] {
// Finished Async Await execution in 1412252929 nanoseconds
        let calendar = Calendar.current
        let asyncAwaitStart = Date.now

        var photos = [Picture]()
        let fetchedPhotos = try await retrievePhotosList()
        try await withThrowingTaskGroup(of: Picture.self) { group in
            for photo in fetchedPhotos {
                group.addTask {
                    let picture = Picture(image: try await fetchPhotoThumbnail(from: photo),
                                          author: photo.author)
                    return picture
                }
            }

            for try await item in group {
                photos.append(item)
            }
        }

        let asyncAwaitEnd = Date.now

        let asyncAwaitNanoseconds = calendar.dateComponents([.nanosecond], from: asyncAwaitStart, to: asyncAwaitEnd).nanosecond!

        print("Finished Async Await execution in \(asyncAwaitNanoseconds) nanoseconds")

        return photos
    }

//    func fetchPhotos() async throws -> [Picture] {
//        // Finished Async Await execution in 2147483647 nanoseconds
//        let calendar = Calendar.current
//        let asyncAwaitStart = Date.now
//
//        var photos = [Picture]()
//        let fetchedPhotos = try await retrievePhotosList()
//        for photo in fetchedPhotos {
//            let picture = Picture(image: try await fetchPhotoThumbnail(from: photo),
//                                  author: photo.author)
//            photos.append(picture)
//        }
//
//        let asyncAwaitEnd = Date.now
//
//        let asyncAwaitNanoseconds = calendar.dateComponents([.nanosecond], from: asyncAwaitStart, to: asyncAwaitEnd).nanosecond!
//
//        print("Finished Async Await execution in \(asyncAwaitNanoseconds) nanoseconds")
//
//        return photos
//    }
}
