import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';
import 'package:page_crealo/desing_system/tokens/app_text_styles.dart';
import 'package:page_crealo/models/reel_video.dart';
import 'package:page_crealo/widgets/instagram_reel_embed.dart';

class VideoCard extends StatelessWidget {
  // El video del embed de Instagram es ~4:5; más alto mostraría los botones.
  static const double aspectRatio = 0.80;

  final ReelVideo video;
  final bool isPlaying;
  final VoidCallback onPlay;

  const VideoCard({
    super.key,
    required this.video,
    required this.isPlaying,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    final embedUrl = video.embedUrl;

    // AspectRatio da una altura intrínseca al contenido (la miniatura y el
    // iframe no tienen una), necesaria para BreakifyHeightMode.equal.
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary, width: 4),
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: embedUrl == null || video.thumbnailUrl.isNotEmpty && !isPlaying
              ? _VideoThumbnail(
                  video: video,
                  onPlay: embedUrl == null ? null : onPlay,
                )
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    // Sin portada propia, el embed inactivo hace de portada.
                    InstagramReelEmbed(
                      key: ValueKey(video.id),
                      embedUrl: embedUrl,
                      title: video.title,
                      interactive: isPlaying,
                    ),
                    if (!isPlaying) _VideoCaption(video: video),
                    if (!isPlaying)
                      Semantics(
                        button: true,
                        label: 'Reproducir video: ${video.title}',
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: onPlay,
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _VideoThumbnail extends StatelessWidget {
  final ReelVideo video;
  final VoidCallback? onPlay;

  const _VideoThumbnail({required this.video, required this.onPlay});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onPlay != null,
      label: 'Reproducir video: ${video.title}',
      child: Material(
        color: AppColors.backgroundDark,
        child: InkWell(
          onTap: onPlay,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (video.thumbnailUrl.isNotEmpty)
                Image.network(
                  video.thumbnailUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const _ThumbnailPlaceholder(),
                )
              else
                const _ThumbnailPlaceholder(),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, AppColors.backgroundDark],
                    stops: [0.45, 1],
                  ),
                ),
              ),
              if (onPlay != null) const Center(child: _PlayIndicator()),
              _VideoCaption(video: video),
            ],
          ),
        ),
      ),
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final ReelVideo video;

  const _VideoCaption({required this.video});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, AppColors.backgroundDark],
                stops: [0.5, 1],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.button.copyWith(color: AppColors.white),
                ),
                if (video.description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    video.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.small.copyWith(
                      color: AppColors.backgroundLight,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThumbnailPlaceholder extends StatelessWidget {
  const _ThumbnailPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: AppColors.surfaceDark);
  }
}

class _PlayIndicator extends StatelessWidget {
  const _PlayIndicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.play_arrow_rounded,
        color: AppColors.white,
        size: 40,
      ),
    );
  }
}
