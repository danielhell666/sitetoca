class CarouselItem {
  final String imageDesktop;
  final String imageMobile;
  final String title;
  final String subtitle;

  const CarouselItem({
    required this.imageDesktop,
    required this.imageMobile,
    required this.title,
    required this.subtitle,
  });
}

const carouselItems = <CarouselItem>[
  CarouselItem(
    imageDesktop: 'assets/images/carousel/foto1.jpeg',
    imageMobile: 'assets/images/carousel/foto1_m.jpeg',
    title: 'Ambiente acolhedor',
    subtitle: 'Espaço preparado para receber crianças e famílias.',
  ),
  CarouselItem(
    imageDesktop: 'assets/images/carousel/foto2.jpeg',
    imageMobile: 'assets/images/carousel/foto2_m.jpeg',
    title: 'Equipe especializada',
    subtitle: 'Profissionais experientes em neurodesenvolvimento.',
  ),
  CarouselItem(
    imageDesktop: 'assets/images/carousel/foto3.jpeg',
    imageMobile: 'assets/images/carousel/foto3_m.jpeg',
    title: 'Atendimento humanizado',
    subtitle: 'Cuidado individualizado para cada criança.',
  ),
  // CarouselItem(
  //   imageDesktop: 'assets/images/carousel/foto4.jpeg',
  //   imageMobile: 'assets/images/carousel/foto4_m.jpeg',
  //   title: 'Estrutura completa',
  //   subtitle: 'Recursos terapêuticos modernos e seguros.',
  // ),
  // CarouselItem(
  //   imageDesktop: 'assets/images/carousel/foto5.jpeg',
  //   imageMobile: 'assets/images/carousel/foto5_m.jpeg',
  //   title: 'Resultados comprovados',
  //   subtitle: 'Histórias de sucesso e progresso de nossos pacientes.',
  // ),
  // CarouselItem(
  //   imageDesktop: 'assets/images/carousel/foto6.jpeg',
  //   imageMobile: 'assets/images/carousel/foto6_m.jpeg',
  //   title: 'Compromisso com a excelência',
  //   subtitle: 'Busca constante por inovação e qualidade.',
  // ),
];