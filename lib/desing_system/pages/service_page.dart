import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/data/social_links.dart';
import 'package:page_crealo/desing_system/atoms/app_button.dart';
import 'package:page_crealo/desing_system/molecules/video_card.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';
import 'package:page_crealo/desing_system/tokens/app_text_styles.dart';
import 'package:page_crealo/models/service.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicePage extends StatefulWidget {
  final Service service;

  const ServicePage({super.key, required this.service});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  String? _playingVideoId;

  Future<void> _openQuote() async {
    final message =
        '¡Hola! Estoy interesado en cotizar el servicio de '
        '${widget.service.name}. Me gustaría recibir más información.';
    final baseUri = Uri.parse(SocialLinks.whatsapp);
    final uri = baseUri.replace(queryParameters: {'text': message});
    final launched = await launchUrl(uri, webOnlyWindowName: '_blank');
    if (!launched && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir WhatsApp.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        foregroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Text(
          widget.service.name,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.button.copyWith(color: AppColors.backgroundDark),
        ),
      ),
      body: SingleChildScrollView(
        child: BreakifySection(
          backgroundColor: AppColors.backgroundLight,
          child: BreakifyContainer(
            maxWidth: const BreakifyValue(sm: 1200),
            padding: const BreakifyValue(
              sm: EdgeInsets.fromLTRB(20, 32, 20, 64),
              md: EdgeInsets.fromLTRB(28, 44, 28, 72),
              lg: EdgeInsets.fromLTRB(32, 56, 32, 84),
            ),
            child: BreakifyBuilder(
              breakpoints: context.breakifyBreakpoints,
              builder: (context, breakpoint, constraints) {
                final isMobile = breakpoint == BreakifyBreakpoint.sm;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.service.name,
                      style: AppTextStyles.h1.copyWith(
                        color: AppColors.primary,
                        fontSize: isMobile ? 48 : 72,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 820),
                      child: Text(
                        widget.service.description,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.backgroundDark,
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      'Trabajos y ejemplos',
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.backgroundDark,
                        fontSize: isMobile ? 32 : 40,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _ExamplesGrid(
                      service: widget.service,
                      playingVideoId: _playingVideoId,
                      onPlayVideo: (id) {
                        setState(() => _playingVideoId = id);
                      },
                    ),
                    const SizedBox(height: 56),
                    Align(
                      alignment: Alignment.center,
                      child: AppButton(
                        label: 'Cotizar este servicio',
                        onPressed: _openQuote,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ExamplesGrid extends StatelessWidget {
  final Service service;
  final String? playingVideoId;
  final ValueChanged<String> onPlayVideo;

  const _ExamplesGrid({
    required this.service,
    required this.playingVideoId,
    required this.onPlayVideo,
  });

  @override
  Widget build(BuildContext context) {
    return BreakifyResponsiveGrid(
      minItemWidth: 260,
      maxColumns: 3,
      spacing: 20,
      heightMode: BreakifyHeightMode.equal,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (final example in service.examples)
          _ExampleTile(
            example: example,
            isPlaying: playingVideoId == example.video?.id,
            onPlay: example.video == null
                ? null
                : () => onPlayVideo(example.video!.id),
          ),
      ],
    );
  }
}

class _ExampleTile extends StatelessWidget {
  final ServiceExample example;
  final bool isPlaying;
  final VoidCallback? onPlay;

  const _ExampleTile({
    required this.example,
    required this.isPlaying,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return switch (example.type) {
      ServiceExampleType.image => _ImageExample(example: example),
      ServiceExampleType.link => _LinkExample(example: example),
      ServiceExampleType.instagramVideo => VideoCard(
        video: example.video!,
        isPlaying: isPlaying,
        onPlay: onPlay ?? () {},
      ),
    };
  }
}

class _ImageExample extends StatelessWidget {
  final ServiceExample example;

  const _ImageExample({required this.example});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.backgroundDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(example.assetPath!, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _LinkExample extends StatelessWidget {
  final ServiceExample example;

  const _LinkExample({required this.example});

  Future<void> _openLink() async {
    final launched = await launchUrl(
      Uri.parse(example.url!),
      webOnlyWindowName: '_blank',
    );
    if (!launched) return;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundDark,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: _openLink,
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 0.8,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.open_in_new_rounded,
                  color: AppColors.primary,
                  size: 44,
                ),
                const SizedBox(height: 20),
                Text(
                  example.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h3.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  'Abrir enlace',
                  style: AppTextStyles.small.copyWith(
                    color: AppColors.backgroundLight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
