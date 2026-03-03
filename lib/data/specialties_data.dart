import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpecialtyItem {
  final String title;
  final String description;
  final IconData icon;

  const SpecialtyItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

const specialtiesItems = <SpecialtyItem>[
  SpecialtyItem(
    title: 'Terapia Ocupacional Infantil',
    description:
        'Atendimento em terapia ocupacional infantil voltado ao desenvolvimento de crianças com atrasos no desenvolvimento, transtornos do neurodesenvolvimento e dificuldades funcionais. Atua nas atividades de vida diária, escolares e lúdicas, promovendo autonomia, independência e participação ativa nos diferentes contextos.',
    icon: FontAwesomeIcons.childReaching,
  ),
  SpecialtyItem(
    title: 'Integração Sensorial de Ayres',
    description:
        'Abordagem especializada da terapia ocupacional para crianças com alterações no processamento sensorial. A intervenção utiliza experiências sensório-motoras estruturadas para favorecer modulação sensorial, planejamento motor e respostas adaptativas funcionais no cotidiano infantil.',
    icon: FontAwesomeIcons.brain,
  ),
  SpecialtyItem(
    title: 'Fisioterapia Infantil',
    description:
        'Fisioterapia voltada ao desenvolvimento motor infantil, com foco em controle postural, coordenação, força e funcionalidade. Indicada para atrasos motores, condições neurológicas e síndromes genéticas, promovendo eficiência do movimento e participação nas atividades diárias.',
    icon: FontAwesomeIcons.personWalking,
  ),
  SpecialtyItem(
    title: 'Psicologia Infantil',
    description:
        'Atendimento psicológico para crianças e adolescentes, com avaliação e intervenção nos aspectos emocionais, comportamentais e sociais. Trabalha regulação emocional, habilidades sociais e manejo de comportamentos, considerando os contextos familiar e escolar.',
    icon: FontAwesomeIcons.userGroup,
  ),
  SpecialtyItem(
    title: 'Nutrição Infantil e Terapia Nutricional',
    description:
        'Avaliação nutricional infantil e intervenção individualizada voltada ao desenvolvimento saudável. Atua em seletividade alimentar, dificuldades alimentares e condições associadas ao neurodesenvolvimento, promovendo alimentação adequada e funcional.',
    icon: FontAwesomeIcons.appleWhole,
  ),
  SpecialtyItem(
    title: 'Avaliação Neuropsicológica Infantil',
    description:
        'Processo estruturado de avaliação neuropsicológica infantil para investigação de atenção, memória, linguagem, funções executivas e aprendizagem. Contribui para diagnóstico diferencial de TDAH, autismo e transtornos de aprendizagem, direcionando o plano terapêutico.',
    icon: FontAwesomeIcons.clipboardCheck,
  ),
];