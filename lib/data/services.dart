import 'package:page_crealo/data/reel_videos.dart';
import 'package:page_crealo/data/social_links.dart';
import 'package:page_crealo/models/reel_video.dart';
import 'package:page_crealo/models/service.dart';

// TODO: Replace the demonstration copy and examples with each service's
// published work. Add new services here without creating new screens.
final services = [
  Service(
    id: 'redes-sociales',
    name: 'Gestión de redes sociales',
    description:
        'No se trata solo de publicar. Construimos una presencia digital con intención.\n'
        'Planeamos la estrategia, desarrollamos las ideas, creamos el contenido y organizamos la comunicación de tu marca para que tus redes tengan coherencia, personalidad y un objetivo claro.\n'
        'Producción audiovisual, portadas, carruseles, fotografía, plantillas, cronogramas y demás.\n'
        'Si hoy necesitas un ecosistema completo, pregunta por nuestros planes premium.',
    examples: [
      ServiceExample.image(
        title: 'Composición visual de marca',
        assetPath: 'assets/images/gestion/gestion_1.jpg',
      ),
      ServiceExample.image(
        title: 'Conoce nuestro trabajo en Instagram',
        assetPath: 'assets/images/gestion/gestion_2.jpg',
      ),
       ServiceExample.image(
        title: 'Conoce nuestro trabajo en Instagram',
        assetPath: 'assets/images/gestion/gestion_3.jpeg',
      ),
      ServiceExample.instagramVideo(
        video: ReelVideo(
          reelUrl:
              'https://www.instagram.com/p/DeAUMHrFmMn/?img_index=2&rpxt=MXd6bG5uZTV0c3Jrbw==',
          thumbnailUrl: '',
          title: 'Carrusel de contenido publicado',
        ),
      ),
    ],
  ),
  Service(
    id: 'estrategia-de-marca',
    name: 'Estrategia de marca',
    description:
        'Antes de crear contenido, necesitamos saber qué quieres decir.\n'
        'Construimos la dirección estratégica que necesita tu marca para dejar de improvisar en redes y empezar a comunicar con intención.\n'
        'Trabajamos público, pilares de contenido, tono de comunicación, conceptos creativos y oportunidades para diferenciarte.\n'
        'Si necesitas darle ruta a tu marca para arrancar a crear, ¡Necesitas empezar por aquí!\n'
        'Esta es.',
    examples: [
      ServiceExample.image(
        title: 'Dirección visual',
        assetPath: 'assets/images/marca/marca_1.jpeg',
      ),
      ServiceExample.instagramVideo(
       video: ReelVideo(
          reelUrl:
              'https://www.instagram.com/reel/DTRL4_ekTPj/?rpxt=a3poaDF3ZWVvOWVp',
          thumbnailUrl: '',
          title: 'Carrusel de contenido publicado',
        ),
      ),
    ],
  ),
  Service(
    id: 'produccion-audiovisual',
    name: 'Producción audiovisual',
    description:
        'Ideas que se ven tan bien como suenan.\n'
        'Conceptualizamos y producimos piezas audiovisuales para marcas, campañas, lanzamientos, productos y servicios.\n'
        'Desde la idea y el guion hasta la grabación, dirección y edición final.\n'
        '¿Solo necesitas video? Esta es la ruta.',
    examples: [
     ServiceExample.instagramVideo(
       video: ReelVideo(
          reelUrl:
              'https://www.instagram.com/reel/DaGYRiFJgTY/?rpxt=NjR3Zmk0aXhra2Jx',
          thumbnailUrl: '',
          title: 'Carrusel de contenido publicado',
        ),
      ),
      ServiceExample.instagramVideo(
       video: ReelVideo(
          reelUrl:
              'https://www.instagram.com/reel/DZsfajMttHX/?srtk=aTAwOWJjdWt4Z2dp',
          thumbnailUrl: '',
          title: 'Carrusel de contenido publicado',
        ),
      ),
      ServiceExample.instagramVideo(
       video: ReelVideo(
          reelUrl:
              'https://www.instagram.com/reel/Dd438_EpQp2/?dlrf=bnoycWc5dXM3bGI0',
          thumbnailUrl: '',
          title: 'Carrusel de contenido publicado',
        ),
      ),
    ],
  ),
  Service(
    id: 'fotografia-marca-producto',
    name: 'Fotografía de la marca o producto',
    description:
        'Porque una buena foto no solo muestra. Hace desear.\n'
        'Creamos fotografías alineadas con la personalidad de tu marca para redes sociales, catálogo y entre otros.\n'
        'Necesitar que tu marca se vea cool, ya no será un problema.',
    examples: [
      ServiceExample.image(
        title: 'Fotografía de producto 1',
        assetPath: 'assets/images/producto/producto_1.webp',
      ),
      ServiceExample.image(
        title: 'Fotografía de producto 2',
        assetPath: 'assets/images/producto/producto_2.webp',
      ),
      ServiceExample.image(
        title: 'Fotografía de producto 3',
        assetPath: 'assets/images/producto/producto_3.webp',
      ),
      ServiceExample.image(
        title: 'Fotografía de producto 4',
        assetPath: 'assets/images/producto/producto_4.webp',
      ),
      ServiceExample.image(
        title: 'Fotografía de producto 5',
        assetPath: 'assets/images/producto/producto_5.webp',
      ),
      ServiceExample.image(
        title: 'Fotografía de producto 6',
        assetPath: 'assets/images/producto/producto_6.webp',
      ),
    ],
  ),
  Service(
    id: 'crealo-360',
    name: 'Capacitaciones — Créalo 360',
    description:
        'Te enseñamos a dejar de improvisar con tu Instagram.\n'
        'Capacitaciones diseñadas para emprendedores y equipos que quieren aprender a gestionar estratégicamente sus propias redes.\n'
        'Desde creación de contenido y organización del feed hasta estrategia, historias, carruseles y herramientas para convertir Instagram en un verdadero canal de comunicación.\n'
        '¡Tú y todo tu equipo tienen que hablar en el mismo idioma!',
    examples: [
      ServiceExample.image(
        title: 'Contenido para aprender',
        assetPath: 'assets/images/collage/collage_6.webp',
      ),
      ServiceExample.instagramVideo(video: reelVideos[3]),
    ],
  ),
];

Service serviceById(String id) =>
    services.firstWhere((service) => service.id == id);
