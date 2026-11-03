class Testimonial {
  final String clientName;
  final String message;
  final String date;
  final bool received;

  const Testimonial({
    required this.clientName,
    required this.message,
    required this.date,
    required this.received,
  });
}

// TODO: Replace these demonstration values with real client testimonials.
const testimonials = [
  Testimonial(
    clientName: '',
    message:
        '¡Estoy feliz! 😍 Imagínate que todos me han preguntado quién me está haciendo el contenidooo 🤭 y que se ve muchísimo el cambio en todo lo que estamos mostrando, en serio muchas graciass! ❤️',
    date: '07 de noviembre de 2025',
    received: true,
  ),
  Testimonial(
    clientName: '',
    message:
        'La calidad de los videos se nota full!! Ya no quiero hacer ni siquiera los videos de apoyo, quiero que todos los hagan ustedes 🥹🤣',
    date: '06 de mayo de 2026',
    received: false,
  ),
  Testimonial(
    clientName: '',
    message:
        'Trabajar con créalo le dio otro salto a nuestra marca 🥹 sentir que tenemos un equipo creativo en todo este proceso ha sido demasiado gratificante! ❤️ ¡De verdad, mil gracias! 😍',
    date: '20 de julio de 2026',
    received: true,
  ),
];
