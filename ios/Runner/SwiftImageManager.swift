
import Photos

class SwiftImageManagerPlugin: NSObject, FlutterPlugin {
    enum MethodCallType: String {
        case fetchAssets
        case requestThumbnail
        case requestPermission
    }

    class ImageRequestBody: Codable {
        let identifier: String
        let width: Int
        let height: Int
        let quality: Int
    }

    private let option: PHImageRequestOptions = {
        let opt = PHImageRequestOptions()
        opt.deliveryMode = .highQualityFormat
        opt.isSynchronous = false
        opt.resizeMode = .fast
        opt.version = .current
        opt.isNetworkAccessAllowed = true
        return opt
    }()

    private let messenger: FlutterBinaryMessenger
    private let dispatchQueue: DispatchQueue

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        self.dispatchQueue = DispatchQueue(
            label: "image_manager",
            qos: .utility,
            attributes: DispatchQueue.Attributes.concurrent
        )
        super.init()
    }

    static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "image_manager", binaryMessenger: registrar.messenger())
        let instance = SwiftImageManagerPlugin(messenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        dispatchQueue.async { [weak self] in self?.handleMethod(call, result: result) }
    }

    private func handleMethod(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch MethodCallType(rawValue: call.method) {
        case .fetchAssets:
            let status: PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
            if (status == PHAuthorizationStatus.denied) {
                return result(FlutterError(
                    code: "PERMISSION_DENIED",
                    message: "The user has denied the gallery access.",
                    details: nil
                ))
            }
            let fetchOption = PHFetchOptions()
            if #available(iOS 9, *) {
                fetchOption.fetchLimit = 0
                fetchOption.includeAssetSourceTypes = [.typeUserLibrary, .typeiTunesSynced, .typeCloudShared]
            }
            fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            fetchOption.predicate = NSPredicate(
                format: "mediaType = %d || mediaType = %d",
                PHAssetMediaType.image.rawValue,
                PHAssetMediaType.video.rawValue
            )
            let fetchResults = PHAsset.fetchAssets(with: fetchOption)
            guard (fetchResults.count > 0) else {
                result([NSDictionary]())
                return
            }
            let results: [NSDictionary] = fetchResults
                .objects(at: IndexSet(integersIn: 0...(fetchResults.count - 1)))
                .map { $0.serialize }
            result(results)
        case .requestThumbnail:
            guard let args = call.arguments,
              let json = try? JSONSerialization.data(withJSONObject: args),
              let body = try? JSONDecoder().decode(ImageRequestBody.self, from: json) else {
                result(FlutterError(
                    code: "INVALID_ARGUMENTS",
                    message: "Requested params are invalid",
                    details: nil))
                return
            }
            let res = PHAsset.fetchAssets(withLocalIdentifiers: [body.identifier], options: nil)
            if (res.count > 0) {
                let asset = res[0]
                let requestId = PHCachingImageManager.default()
                    .requestImage(
                        for: asset,
                        targetSize: CGSize(width: body.width, height: body.height),
                        contentMode: .aspectFill,
                        options: option,
                        resultHandler: { [weak self] (image: UIImage?, info) in
                            self?.messenger.send(
                                onChannel: "image_manager/thumbnail/\(body.identifier)_\(body.width)_\(body.height)",
                                message: image.flatMap { img in img.jpegData(compressionQuality: CGFloat(body.quality / 100)) }
                            )
                    })
                if (PHInvalidImageRequestID == requestId) {
                    result(FlutterError(code: "ASSET_DOES_NOT_EXIST", message: "The requested image does not exist.", details: nil));
                } else {
                  result(true)
                }

            }
        case .requestPermission:
            guard PHPhotoLibrary.authorizationStatus() == .notDetermined else { return result(true) }
            PHPhotoLibrary.requestAuthorization { _ in result(true) }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

private extension PHAsset {
    var serialize: NSDictionary {
        return [
            "identifier": localIdentifier,
            "width": pixelWidth,
            "height": pixelHeight,
            "orientation": 0,
            "longitude": location?.coordinate.longitude ?? NSNull(),
            "latitude": location?.coordinate.latitude ?? NSNull(),
            "timestamp": creationDate?.timeIntervalSince1970 ?? NSNull(),
            "duration": duration,
            "type": mediaType == .image ? "image" : "movie"
        ]
    }
}
