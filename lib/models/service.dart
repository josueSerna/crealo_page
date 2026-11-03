import 'package:page_crealo/models/reel_video.dart';

enum ServiceExampleType { image, link, instagramVideo }

class ServiceExample {
  final ServiceExampleType type;
  final String title;
  final String? assetPath;
  final String? url;
  final ReelVideo? video;

  const ServiceExample.image({required this.title, required this.assetPath})
    : type = ServiceExampleType.image,
      url = null,
      video = null;

  const ServiceExample.link({required this.title, required this.url})
    : type = ServiceExampleType.link,
      assetPath = null,
      video = null;

  const ServiceExample.instagramVideo({required this.video})
    : type = ServiceExampleType.instagramVideo,
      title = '',
      assetPath = null,
      url = null;
}

class Service {
  final String id;
  final String name;
  final String description;
  final List<ServiceExample> examples;

  const Service({
    required this.id,
    required this.name,
    required this.description,
    required this.examples,
  });
}
