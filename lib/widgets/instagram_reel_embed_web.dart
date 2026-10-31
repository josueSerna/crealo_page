import 'dart:js_interop';
import 'dart:ui_web' as ui_web;

import 'package:flutter/widgets.dart';

@JS('document')
external _Document get _document;

extension type _Document._(JSObject _) implements JSObject {
  external JSObject createElement(String tag);
}

extension type _Element._(JSObject _) implements JSObject {
  external void setAttribute(String name, String value);
}

@JS('window')
external _Window get _window;

extension type _Window._(JSObject _) implements JSObject {
  external void addEventListener(String type, JSFunction listener);
  external void removeEventListener(String type, JSFunction listener);
}

/// Embed oficial de Instagram (iframe `/embed/`) recortado para mostrar solo
/// el video, sin la cabecera de perfil ni el pie "Ver más en Instagram".
///
/// Mientras [interactive] es falso el iframe no recibe toques (sirve como
/// portada y no bloquea el scroll). Cuando es verdadero, dos franjas laterales
/// de Flutter quedan libres para poder seguir haciendo scroll con el dedo.
class InstagramReelEmbed extends StatefulWidget {
  final String embedUrl;
  final String title;
  final bool interactive;

  const InstagramReelEmbed({
    super.key,
    required this.embedUrl,
    required this.title,
    this.interactive = true,
  });

  @override
  State<InstagramReelEmbed> createState() => _InstagramReelEmbedState();
}

class _InstagramReelEmbedState extends State<InstagramReelEmbed> {
  static int _counter = 0;

  // Alto fijo de la cabecera del embed. El video mide ~1.25 veces su ancho
  // y justo debajo empiezan los botones de like/comentar, que quedan fuera.
  static const _headerPx = 54;
  static const double _edgeWidth = 40;
  static const double _topBandHeight = 90;

  late final String _viewType = 'crealo-instagram-embed-${_counter++}';
  _Element? _iframe;

  // Tras el primer clic dentro del iframe (play) el foco pasa al iframe y la
  // ventana emite `blur`; desde ahí el iframe deja de capturar eventos para
  // que la página haga scroll con normalidad mientras el video sigue sonando.
  bool _passive = false;
  late final JSFunction _onBlur = (() {
    if (mounted && widget.interactive && !_passive) {
      setState(() => _passive = true);
      _applyStyle();
    }
  }).toJS;

  bool get _capturing => widget.interactive && !_passive;

  @override
  void initState() {
    super.initState();
    _window.addEventListener('blur', _onBlur);
    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final iframe = _Element._(_document.createElement('iframe'))
        ..setAttribute('src', widget.embedUrl)
        ..setAttribute('title', widget.title)
        ..setAttribute('frameborder', '0')
        ..setAttribute('scrolling', 'no')
        ..setAttribute('allowfullscreen', 'true')
        ..setAttribute(
          'allow',
          'autoplay; encrypted-media; fullscreen; picture-in-picture',
        );
      _iframe = iframe;
      _applyStyle();
      return iframe;
    });
  }

  @override
  void dispose() {
    _window.removeEventListener('blur', _onBlur);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant InstagramReelEmbed oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.interactive && !widget.interactive) {
      // Recargar el iframe detiene la reproducción al elegir otro video.
      _passive = false;
      _iframe?.setAttribute('src', widget.embedUrl);
    }
    _applyStyle();
  }

  void _applyStyle() {
    _iframe?.setAttribute(
      'style',
      'border:0;width:100%;height:calc(100% + ${_headerPx}px);'
          'margin-top:-${_headerPx}px;background:#000000;'
          'pointer-events:${_capturing ? 'auto' : 'none'};',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRect(child: HtmlElementView(viewType: _viewType)),
        ),
        // Bandas libres para poder seguir haciendo scroll (rueda o dedo)
        // aunque el iframe esté activo; el centro queda para los controles.
        if (widget.interactive && _passive)
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() => _passive = false);
                _applyStyle();
              },
            ),
          ),
        if (_capturing) ...[
          const Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: _edgeWidth,
            child: _ScrollEdge(),
          ),
          const Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: _edgeWidth,
            child: _ScrollEdge(),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: _topBandHeight,
            child: const _ScrollEdge(),
          ),
        ],
      ],
    );
  }
}

/// Franja transparente que recibe los gestos y deja pasar el scroll de la página.
class _ScrollEdge extends StatelessWidget {
  const _ScrollEdge();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: const SizedBox.expand(),
    );
  }
}
