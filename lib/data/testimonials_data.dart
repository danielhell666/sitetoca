class Testimonial {
  final String name;
  final String text;

  const Testimonial({required this.name, required this.text});
}

const testimonialsData = <Testimonial>[
  Testimonial(
    name: 'Mãe de paciente',
    text:
        'Fomos acolhidos desde o primeiro contato. A equipe explicou tudo com clareza e o acompanhamento tem sido excelente.',
  ),
  Testimonial(
    name: 'Responsável',
    text:
        'O plano terapêutico é bem organizado e a evolução ficou visível na rotina e na escola.',
  ),
  Testimonial(
    name: 'Família',
    text:
        'Atendimento humanizado e profissional. A clínica realmente se preocupa com a criança e com a família.',
  ),
];